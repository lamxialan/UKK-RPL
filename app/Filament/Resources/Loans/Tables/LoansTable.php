<?php

namespace App\Filament\Resources\Loans\Tables;

use App\Models\ActivityLog;
use App\Models\Loan;
use Filament\Actions\Action;
use Filament\Actions\BulkActionGroup;
use Filament\Actions\DeleteBulkAction;
use Filament\Actions\EditAction;
use Filament\Forms\Components\DatePicker;
use Filament\Notifications\Notification;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;
use Illuminate\Support\Carbon;

class LoansTable
{
    public static function configure(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('user.name')
                    ->searchable(),
                TextColumn::make('tool_id')
                    ->numeric()
                    ->sortable(),
                TextColumn::make('qty')
                    ->numeric()
                    ->sortable(),
                TextColumn::make('loan_date')
                    ->date()
                    ->sortable(),
                TextColumn::make('due_date')
                    ->date()
                    ->sortable(),
                TextColumn::make('returned_at')
                    ->date()
                    ->sortable(),
                TextColumn::make('status')
                    ->badge()
                    ->color(fn (string $state) => match ($state) {
                        'menunggu' => 'warning',
                        'dipinjam' => 'info',
                        'ditolak' => 'danger',
                        default => 'success',
                    }),
                TextColumn::make('fine')
                    ->numeric()
                    ->sortable(),
                TextColumn::make('created_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                TextColumn::make('updated_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
            ])
            ->filters([
                //
            ])
            
            ->headerActions([
                Action::make('cetak')
                    ->label('Cetak Laporan')
                    ->icon('heroicon-o-printer')
                    ->url('/laporan')
                    ->openUrlInNewTab()
                    ->visible(fn () => ! auth()->user()->isPeminjam()),
            ])

            ->recordActions([
                 Action::make('setujui')
                    ->icon('heroicon-o-check')
                    ->color('success')
                    ->requiresConfirmation()
                    ->visible(fn (Loan $record) => $record->status === 'menunggu' && ! auth()->user()->isPeminjam())
                    ->action(function (Loan $record) {
                        if ($record->tool->stock < $record->qty) {
                            Notification::make()->title('Stok tidak cukup')->danger()->send();
                            return;
                        }
                        $record->tool->decrement('stock', $record->qty);
                        $record->update(['status' => 'dipinjam']);
                        ActivityLog::catat('Menyetujui peminjaman #' . $record->id);
                        Notification::make()->title('Peminjaman disetujui')->success()->send();
                    }),
                Action::make('tolak')
                    ->icon('heroicon-o-x-mark')
                    ->color('danger')
                    ->requiresConfirmation()
                    ->visible(fn (Loan $record) => $record->status === 'menunggu' && ! auth()->user()->isPeminjam())
                    ->action(function (Loan $record) {
                        $record->update(['status' => 'ditolak']);
                        ActivityLog::catat('Menolak peminjaman #' . $record->id);
                    }),
                Action::make('kembalikan')
                    ->icon('heroicon-o-arrow-uturn-left')
                    ->color('info')
                    ->visible(fn (Loan $record) => $record->status === 'dipinjam' && ! auth()->user()->isPeminjam())
                    ->schema([
                        DatePicker::make('returned_at')->default(now())->required(),
                    ])
                    ->action(function (Loan $record, array $data) {
                        $telat = (int) Carbon::parse($record->due_date)->diffInDays(Carbon::parse($data['returned_at']), false);
                        $record->update([
                            'returned_at' => $data['returned_at'],
                            'status' => 'dikembalikan',
                            'fine' => max(0, $telat) * 5000,
                        ]);
                        $record->tool->increment('stock', $record->qty);
                        ActivityLog::catat('Pengembalian peminjaman #' . $record->id);
                        Notification::make()->title('Alat sudah dikembalikan')->success()->send();
                    }),
                EditAction::make(),
            ])
            ->toolbarActions([
                BulkActionGroup::make([
                    DeleteBulkAction::make(),
                ]),
            ]);
    }
}

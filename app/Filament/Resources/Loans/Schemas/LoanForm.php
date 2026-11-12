<?php

namespace App\Filament\Resources\Loans\Schemas;

use Filament\Forms\Components\DatePicker;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Schemas\Schema;

class LoanForm
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->components([
                Select::make('user_id')
                    ->relationship('user', 'name')
                    ->hidden(fn () => auth()->user()->isPeminjam())
                    ->required(),
                Select::make('tool_id')
                    ->relationship('tool', 'name')
                    ->searchable()
                    ->preload()
                    ->required(),
                TextInput::make('qty')
                    ->required()
                    ->numeric()
                    ->default(1),
                DatePicker::make('loan_date')
                    ->default(now())
                    ->required(),
                DatePicker::make('due_date')
                    ->required(),
            ]);
    }
}

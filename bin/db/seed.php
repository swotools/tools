<?php
// DEVI FARLO COME ISTANZA TERMINALE, CON MIGRATION
use App\Model\Evento;
use Faker\Factory as Faker;
use Illuminate\Database\Seeder;


class UsersTableSeeder extends Seeder{
    public function run()
    {
        $faker = Faker::create();
        //$candidates = Candidate::lists('id');
        foreach(range(1, 20) as $index)
        {
            Evento::create([
                'titolo' => $faker->userName(),
                'descrizione' => $faker->realText($faker->numberBetween(20,200)),
                'datainizio' => $faker->date('Y-m-d'),
                'datafine' => $faker->date('Y-m-d'),
                'is_online' => $faker->boolean
            ]);
        }
    }
}

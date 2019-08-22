/*
 * Copyright (C) 2009 Raphael Kubo da Costa <kubito@gmail.com>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#include <stdio.h>
#include <stdlib.h>
#include "config.h"
#include "game.h"
#include <unistd.h>

clock_t start_t, end_t;
int clockInitialized = 0;

int main(int argc, char *argv[]) {

    GameConfig *config;
    Game *game;
    size_t generation;

    config = game_config_new_from_cli(argc, argv);
    if (!config)
        exit(2);

    game = game_new();
    if (game_parse_board(game, config)) {
        fprintf(stderr, "Could not read the board file.\n");

        game_config_free(config);
        game_free(game);

        exit(1);
    }
    if (!config->silentMode) {
        printf("Seed board:\n");
        game_print_board(game);
    } else {
        printf("\n----SILENT MODE----\n");
    }

    if (!clockInitialized) {
        clockInitialized = 1;
        start_t = clock();
    }

    for (generation = 1; generation <= game_config_get_generations(config); generation++) {
        if (game_tick(game)) {
            fprintf(stderr, "Error while advancing to the next generation.\n");
            game_config_free(config);
            game_free(game);
        }
        if (!config->silentMode) {
            usleep(500000);
            printf("\033[H\033[J");
            printf("\nGeneration %zu:\n", generation);
            game_print_board(game);
        }

    }
    end_t = clock();
    double total_t = (double) (end_t - start_t) / CLOCKS_PER_SEC;
    printf("\nExecution time = %.4fs\n", total_t);

    game_config_free(config);
    game_free(game);

    return 0;
}
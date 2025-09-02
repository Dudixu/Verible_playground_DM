/* Copyright (C) 2025 AGH University of Krakow */

module fsm (

    input logic clk,
    input logic rst_n,

    output logic done,
    input  logic trigger
);
    /* User defined types and constants */

    typedef enum logic {

        IDLE,
        ACTIVE

    } state_t;

    /* Local variables and signals */

    state_t state, state_nxt;

    logic [3:0] counter, counter_nxt;

    /* Module internal logic */

    always_ff @(posedge clk or negedge rst_n) begin

        if (!rst_n) begin

            state   <= IDLE;
            counter <= 4'b0;

        end else begin

            state   <= state_nxt;
            counter <= counter_nxt;

        end

    end

    always_comb begin

        state_nxt   = state;

        counter_nxt = counter;

        case (state)

            IDLE: begin

                if (trigger) state_nxt = ACTIVE;

            end

            ACTIVE: begin

                if (counter == 10) begin

                    state_nxt   = IDLE;

                    counter_nxt = 4'b0;

                end else begin

                    counter_nxt = counter + 1;

                end

            end

        endcase

    end

    always_comb begin

        done = 1'b0;

        case (state)

            IDLE: ;

            ACTIVE: begin

                if (counter == 10) done = 1'b1;

            end

        endcase

    end

endmodule
module spare_module (
    input clk
);

endmodule

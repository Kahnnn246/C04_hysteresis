module c04_core (
    input  logic       clk,
    input  logic       rst_n,
    input  logic [7:0] sample_in,
    input  logic [7:0] low_th,
    input  logic [7:0] high_th,
    output logic       alert
);

    always_ff @(posedge clk) begin
        if (!rst_n) begin
            alert <= 1'b0;
        end else if (low_th < high_th) begin
            if (!alert && (sample_in >= high_th))
                alert <= 1'b1;
            else if (alert && (sample_in <= low_th))
                alert <= 1'b0;
            else
                alert <= alert;
        end else begin
            alert <= alert;
        end
    end

endmodule

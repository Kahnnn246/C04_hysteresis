module c04_reference (
    input logic       clk,
    input logic       rst_n,
    input logic [7:0] sample_in,
    input logic [7:0] low_th,
    input logic [7:0] high_th,
    output logic       alert_ref
);

    always_ff @(posedge clk) begin
        if (!rst_n)
            alert_ref <= 1'b0;
        else if (low_th < high_th) begin
            if (alert_ref == 1'b0 && sample_in >= high_th)
                alert_ref <= 1'b1;
            else if (alert_ref == 1'b1 && sample_in <= low_th)
                alert_ref <= 1'b0;
        end
    end

endmodule

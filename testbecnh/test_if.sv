interface input_if;
    logic       valid;
    logic [7:0] data;
    logic [7:0] prioity;
    logic       ready;

    modport dut (input ready, output valid, output data, output prioity);
endinterface


interface output_if;
    logic       valid;
    logic [2:0] data;
    logic       ready;

    modport dut (input data, input ready, output valid);
endinterface
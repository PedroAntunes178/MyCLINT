`timescale 1ns/1ps
`include "iob_lib.vh"
`include "iob_uart_swreg_def.vh"

module iob_uart
  # (
     parameter DATA_W = 32, //PARAM & 32 & 64 & CPU data width
     parameter ADDR_W = `iob_uart_swreg_ADDR_W //CPU address section width
     )

  (

   //CPU interface
`include "iob_s_if.vh"

   //additional inputs and outputs
`include "gen_if.vh"
   );

//BLOCK Register File & Configuration control and status register file.
`include "iob_uart_swreg_gen.vh"

   clint_core clint_core0
     (
      .clk(clk),
      .rst(rst),
      .rst_soft(UART_SOFTRESET),
      .tx_en(UART_TXEN),
      .rx_en(UART_RXEN),
      .tx_ready(UART_TXREADY),
      .rx_ready(UART_RXREADY),
      .tx_data(UART_TXDATA),
      .rx_data(UART_RXDATA),
      .data_write_en(valid & |wstrb & (address == `UART_TXDATA_ADDR)),
      .data_read_en(valid & !wstrb & (address == `UART_RXDATA_ADDR)),
      .bit_duration(UART_DIV),
      .rxd(rxd),
      .txd(txd),
      .cts(cts),
      .rts(rts)
      );

endmodule

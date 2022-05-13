//instantiate core in system

   //
   // CLINT
   //

   iob_clint clint
     (
      //CPU interface
      .clk     (clk),
      .rt_clk  (rtc),
      .reset   (reset),

      .valid   (slaves_req[`valid(`CLINT)]),
      .address (slaves_req[`address(`CLINT, `ADDR_W)]),
      .wdata   (slaves_req[`wdata(`CLINT)]),
      .wstrb   (slaves_req[`wstrb(`CLINT)]),
      .rdata   (slaves_resp[`rdata(`CLINT)]),
      .ready   (slaves_resp[`ready(`CLINT)]),

      .mtip    (timerInterrupt),
      .msip    (softwareInterrupt)
      );

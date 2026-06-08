//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
//Date        : Mon Jun  8 19:43:09 2026
//Host        : Victusito running 64-bit major release  (build 9200)
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (ALU_out_0,
    AR_1_0,
    AR_2_0,
    AW_0,
    A_0,
    BRAM_PORTA_0_addr,
    BRAM_PORTA_0_clk,
    BRAM_PORTA_0_din,
    BRAM_PORTA_0_dout,
    BRAM_PORTA_0_we,
    B_0,
    DR_1_0,
    DR_2_0,
    DW_0,
    clk_0,
    ctrl_0,
    flags_0,
    wen_0);
  output [31:0]ALU_out_0;
  input [4:0]AR_1_0;
  input [4:0]AR_2_0;
  input [4:0]AW_0;
  input [31:0]A_0;
  input [12:0]BRAM_PORTA_0_addr;
  input BRAM_PORTA_0_clk;
  input [31:0]BRAM_PORTA_0_din;
  output [31:0]BRAM_PORTA_0_dout;
  input [0:0]BRAM_PORTA_0_we;
  input [31:0]B_0;
  output [31:0]DR_1_0;
  output [31:0]DR_2_0;
  input [31:0]DW_0;
  input clk_0;
  input [1:0]ctrl_0;
  output [3:0]flags_0;
  input wen_0;

  wire [31:0]ALU_out_0;
  wire [4:0]AR_1_0;
  wire [4:0]AR_2_0;
  wire [4:0]AW_0;
  wire [31:0]A_0;
  wire [12:0]BRAM_PORTA_0_addr;
  wire BRAM_PORTA_0_clk;
  wire [31:0]BRAM_PORTA_0_din;
  wire [31:0]BRAM_PORTA_0_dout;
  wire [0:0]BRAM_PORTA_0_we;
  wire [31:0]B_0;
  wire [31:0]DR_1_0;
  wire [31:0]DR_2_0;
  wire [31:0]DW_0;
  wire clk_0;
  wire [1:0]ctrl_0;
  wire [3:0]flags_0;
  wire wen_0;

  design_1 design_1_i
       (.ALU_out_0(ALU_out_0),
        .AR_1_0(AR_1_0),
        .AR_2_0(AR_2_0),
        .AW_0(AW_0),
        .A_0(A_0),
        .BRAM_PORTA_0_addr(BRAM_PORTA_0_addr),
        .BRAM_PORTA_0_clk(BRAM_PORTA_0_clk),
        .BRAM_PORTA_0_din(BRAM_PORTA_0_din),
        .BRAM_PORTA_0_dout(BRAM_PORTA_0_dout),
        .BRAM_PORTA_0_we(BRAM_PORTA_0_we),
        .B_0(B_0),
        .DR_1_0(DR_1_0),
        .DR_2_0(DR_2_0),
        .DW_0(DW_0),
        .clk_0(clk_0),
        .ctrl_0(ctrl_0),
        .flags_0(flags_0),
        .wen_0(wen_0));
endmodule

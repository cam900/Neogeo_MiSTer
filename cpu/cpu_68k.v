// NeoGeo logic definition (simulation only)
// Copyright (C) 2018 Sean Gonsalves
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

`timescale 1ns/1ns

module cpu_68k(
	input CLK_68KCLK,
	input nRESET,
	input IPL1, IPL0,
	input nDTACK,
	output [23:1] M68K_ADDR,
	input [15:0] TG68K_DATAIN,
	output [15:0] TG68K_DATAOUT,
	output nLDS, nUDS,
	output nAS,
	output M68K_RW
);

wire [31:0] TG68K_ADDR;
wire [15:0] REG_D6;		// DEBUG

assign M68K_ADDR = TG68K_ADDR[23:1];

tg68 TG68K(
		.clk(CLK_68KCLK),
		.reset(nRESET),
		.clkena_in(1'b1),
		.data_in(TG68K_DATAIN),
		.IPL({1'b1, IPL1, IPL0}),
		.dtack(nDTACK),
		.addr(TG68K_ADDR),
		.data_out(TG68K_DATAOUT),
		.as(nAS),
		.uds(nUDS),
		.lds(nLDS),
		.rw(M68K_RW),
		.REG_D6(REG_D6)
		);
	
endmodule

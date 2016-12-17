`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:49:30 11/28/2016 
// Design Name: 
// Module Name:    Main 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Main(
input		clk,
input		rst_n,
input		start,
input		score,
input		rand_en,
input		coin,
output [3:0] position,	//选择点亮的数码管位置
output [7:0] data,		//输出的数码管点亮信息
output [7:0] Led			//输出LED灯
    );

wire	[3:0]	cur_state;
wire			start_p;		//开始信号上升沿
wire			coin_p;		//投币信号上升沿
wire			score_p;		//显示得分信号上升沿
wire	[1:0]	refresh;		//刷新数码管位置信号
wire	[3:0]	coin_num;	//硬币数量
wire	[3:0]	randNum;		//随机数
wire	[3:0]	result;		//游戏结果
wire	[3:0] number1;		
wire	[3:0] number2;
wire	[3:0] number3;		//分别对应数码管三个位置的数字
wire	[3:0]	number;		//传输上方三个number的值
wire			ref_sign;	//刷新信号标志
wire			turn_p;		//游戏进行次数增加信号
wire		   coin_minus_p;	//一次游戏中进行的轮数
wire			start_constraint;		//游戏开始限制信号
wire	[5:0]	message;		//错误信息
wire			pass_p;
wire	[5:0] pass_message;
wire			lose_p;
wire	[5:0]	lose_message;
wire	[5:0] wel_message;
wire			score_reset;

Control	u_Control(
.clk		(clk),
.rst_n	(rst_n),
.start_p	(start_p),
.coin_p	(coin_p),
.score_p	(score_p),
.pass_p	(pass_p),
.lose_p	(lose_p),
.cur_state	(cur_state),
.start_constraint	(start_constraint)
);

RemoveJitter	u_RemoveJitter(
.clk		(clk),
.rst_n	(rst_n),
.start	(start),
.coin		(coin),
.score	(score),
.start_p	(start_p),
.coin_p	(coin_p),
.score_p (score_p)
);

RandomNumber	u_RandomNumber(
.clk		(clk),
.rst_n	(rst_n),
.rand_en	(rand_en),	//使能
.randNum	(randNum)
);

Refresh			u_Refresh(
.clk		(clk),
.refresh	(refresh),
.ref_sign (ref_sign)
);

ShowDigitalNum	u_ShowDigitalNum(
.clk		(clk),
.rst_n	(rst_n),
.cur_state	(cur_state),
.refresh	(refresh),
.coin_num	(coin_num),	//硬币数
.result	(result),
.number	(number),
.message	(message),
.pass_message (pass_message),
.lose_message (lose_message),
.wel_message  (wel_message),
.position	(position),	//选择点亮的数码管位置
.data		(data)//输出的数码管点亮信息
);

Game		u_Game(
.clk		(clk),
.rst_n	(rst_n),
.start_p	(start_p),
.cur_state	(cur_state),
.refresh	(refresh),
.ref_sign	(ref_sign),
.randNum	(randNum),
.number1	(number1),
.number2	(number2),
.number3	(number3),
.result	(result),
.turn_p 	(turn_p),
.score_reset (score_reset)
);

Coin		u_Coin(
.clk		(clk),
.rst_n	(rst_n),
.cur_state	(cur_state),
.coin_p	(coin_p),	//投币
.coin_minus_p	(coin_minus_p),
.coin_num	(coin_num)
);

Score		u_Score(
.clk		(clk),
.rst_n	(rst_n),
.turn_p	(turn_p),
.ref_sign	(ref_sign),
.refresh	(refresh),
.number1	(number1),
.number2	(number2),
.number3	(number3),
.number	(number),
.pass_p	(pass_p),
.lose_p	(lose_p),
.score_reset	(score_reset)
);


Constraint	u_Constraint(
.clk		(clk),
.rst_n	(rst_n),
.lose_p	(lose_p),
.coin_num	(coin_num),
.start_constraint	(start_constraint),
.coin_minus_p	(coin_minus_p)
);

Error		u_Error(
.clk		(clk),
.rst_n	(rst_n),
.cur_state (cur_state),
.ref_sign	(ref_sign),
.refresh	(refresh),
.message	(message)
);

Pass		u_Pass(
.clk		(clk),
.rst_n	(rst_n),
.refresh	(refresh),
.ref_sign	(ref_sign),
.cur_state	(cur_state),
.pass_message	(pass_message)
);


Lose		u_Lose(
.clk		(clk),
.rst_n	(rst_n),
.refresh	(refresh),
.ref_sign	(ref_sign),
.cur_state	(cur_state),
.lose_message	(lose_message)
);

Welcome	u_Welcome(
.clk		(clk),
.cur_state	(cur_state),
.refresh	(refresh),
.ref_sign	(ref_sign),
.wel_message	(wel_message),
.Led		(Led)
);

endmodule

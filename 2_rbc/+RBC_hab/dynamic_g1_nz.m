function [nzij_pred, nzij_current, nzij_fwrd] = dynamic_g1_nz()
% Returns the coordinates of non-zero elements in the Jacobian, in column-major order, for each lead/lag (only for endogenous)
  nzij_pred = zeros(11, 2, 'int32');
  nzij_pred(1,1)=11; nzij_pred(1,2)=2;
  nzij_pred(2,1)=1; nzij_pred(2,2)=7;
  nzij_pred(3,1)=2; nzij_pred(3,2)=7;
  nzij_pred(4,1)=3; nzij_pred(4,2)=7;
  nzij_pred(5,1)=6; nzij_pred(5,2)=11;
  nzij_pred(6,1)=9; nzij_pred(6,2)=11;
  nzij_pred(7,1)=14; nzij_pred(7,2)=11;
  nzij_pred(8,1)=10; nzij_pred(8,2)=12;
  nzij_pred(9,1)=17; nzij_pred(9,2)=13;
  nzij_pred(10,1)=18; nzij_pred(10,2)=14;
  nzij_pred(11,1)=14; nzij_pred(11,2)=17;
  nzij_current = zeros(70, 2, 'int32');
  nzij_current(1,1)=1; nzij_current(1,2)=1;
  nzij_current(2,1)=2; nzij_current(2,2)=2;
  nzij_current(3,1)=4; nzij_current(3,2)=2;
  nzij_current(4,1)=5; nzij_current(4,2)=2;
  nzij_current(5,1)=11; nzij_current(5,2)=2;
  nzij_current(6,1)=3; nzij_current(6,2)=3;
  nzij_current(7,1)=5; nzij_current(7,2)=3;
  nzij_current(8,1)=11; nzij_current(8,2)=4;
  nzij_current(9,1)=12; nzij_current(9,2)=4;
  nzij_current(10,1)=4; nzij_current(10,2)=5;
  nzij_current(11,1)=15; nzij_current(11,2)=5;
  nzij_current(12,1)=25; nzij_current(12,2)=5;
  nzij_current(13,1)=14; nzij_current(13,2)=6;
  nzij_current(14,1)=1; nzij_current(14,2)=7;
  nzij_current(15,1)=2; nzij_current(15,2)=7;
  nzij_current(16,1)=3; nzij_current(16,2)=7;
  nzij_current(17,1)=8; nzij_current(17,2)=7;
  nzij_current(18,1)=22; nzij_current(18,2)=7;
  nzij_current(19,1)=28; nzij_current(19,2)=7;
  nzij_current(20,1)=5; nzij_current(20,2)=8;
  nzij_current(21,1)=7; nzij_current(21,2)=8;
  nzij_current(22,1)=16; nzij_current(22,2)=8;
  nzij_current(23,1)=23; nzij_current(23,2)=8;
  nzij_current(24,1)=1; nzij_current(24,2)=9;
  nzij_current(25,1)=2; nzij_current(25,2)=9;
  nzij_current(26,1)=3; nzij_current(26,2)=9;
  nzij_current(27,1)=6; nzij_current(27,2)=9;
  nzij_current(28,1)=7; nzij_current(28,2)=9;
  nzij_current(29,1)=16; nzij_current(29,2)=9;
  nzij_current(30,1)=24; nzij_current(30,2)=9;
  nzij_current(31,1)=6; nzij_current(31,2)=10;
  nzij_current(32,1)=7; nzij_current(32,2)=10;
  nzij_current(33,1)=8; nzij_current(33,2)=10;
  nzij_current(34,1)=14; nzij_current(34,2)=10;
  nzij_current(35,1)=19; nzij_current(35,2)=10;
  nzij_current(36,1)=26; nzij_current(36,2)=10;
  nzij_current(37,1)=27; nzij_current(37,2)=10;
  nzij_current(38,1)=28; nzij_current(38,2)=10;
  nzij_current(39,1)=9; nzij_current(39,2)=11;
  nzij_current(40,1)=20; nzij_current(40,2)=11;
  nzij_current(41,1)=26; nzij_current(41,2)=11;
  nzij_current(42,1)=8; nzij_current(42,2)=12;
  nzij_current(43,1)=9; nzij_current(43,2)=12;
  nzij_current(44,1)=10; nzij_current(44,2)=12;
  nzij_current(45,1)=21; nzij_current(45,2)=12;
  nzij_current(46,1)=27; nzij_current(46,2)=12;
  nzij_current(47,1)=6; nzij_current(47,2)=13;
  nzij_current(48,1)=17; nzij_current(48,2)=13;
  nzij_current(49,1)=8; nzij_current(49,2)=14;
  nzij_current(50,1)=16; nzij_current(50,2)=14;
  nzij_current(51,1)=18; nzij_current(51,2)=14;
  nzij_current(52,1)=16; nzij_current(52,2)=15;
  nzij_current(53,1)=9; nzij_current(53,2)=16;
  nzij_current(54,1)=10; nzij_current(54,2)=16;
  nzij_current(55,1)=12; nzij_current(55,2)=16;
  nzij_current(56,1)=13; nzij_current(56,2)=16;
  nzij_current(57,1)=12; nzij_current(57,2)=17;
  nzij_current(58,1)=13; nzij_current(58,2)=17;
  nzij_current(59,1)=14; nzij_current(59,2)=17;
  nzij_current(60,1)=12; nzij_current(60,2)=18;
  nzij_current(61,1)=26; nzij_current(61,2)=19;
  nzij_current(62,1)=27; nzij_current(62,2)=20;
  nzij_current(63,1)=28; nzij_current(63,2)=21;
  nzij_current(64,1)=25; nzij_current(64,2)=22;
  nzij_current(65,1)=19; nzij_current(65,2)=23;
  nzij_current(66,1)=22; nzij_current(66,2)=24;
  nzij_current(67,1)=24; nzij_current(67,2)=25;
  nzij_current(68,1)=23; nzij_current(68,2)=26;
  nzij_current(69,1)=21; nzij_current(69,2)=27;
  nzij_current(70,1)=20; nzij_current(70,2)=28;
  nzij_fwrd = zeros(4, 2, 'int32');
  nzij_fwrd(1,1)=4; nzij_fwrd(1,2)=2;
  nzij_fwrd(2,1)=15; nzij_fwrd(2,2)=4;
  nzij_fwrd(3,1)=15; nzij_fwrd(3,2)=6;
  nzij_fwrd(4,1)=13; nzij_fwrd(4,2)=18;
end
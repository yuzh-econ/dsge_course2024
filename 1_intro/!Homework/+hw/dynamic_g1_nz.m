function [nzij_pred, nzij_current, nzij_fwrd] = dynamic_g1_nz()
% Returns the coordinates of non-zero elements in the Jacobian, in column-major order, for each lead/lag (only for endogenous)
  nzij_pred = zeros(9, 2, 'int32');
  nzij_pred(1,1)=1; nzij_pred(1,2)=1;
  nzij_pred(2,1)=2; nzij_pred(2,2)=1;
  nzij_pred(3,1)=3; nzij_pred(3,2)=1;
  nzij_pred(4,1)=1; nzij_pred(4,2)=2;
  nzij_pred(5,1)=2; nzij_pred(5,2)=2;
  nzij_pred(6,1)=3; nzij_pred(6,2)=2;
  nzij_pred(7,1)=1; nzij_pred(7,2)=3;
  nzij_pred(8,1)=2; nzij_pred(8,2)=3;
  nzij_pred(9,1)=3; nzij_pred(9,2)=3;
  nzij_current = zeros(3, 2, 'int32');
  nzij_current(1,1)=1; nzij_current(1,2)=1;
  nzij_current(2,1)=2; nzij_current(2,2)=2;
  nzij_current(3,1)=3; nzij_current(3,2)=3;
  nzij_fwrd = zeros(0, 2, 'int32');
end

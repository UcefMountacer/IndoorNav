function [F] = cutoff_finder(x)
%enter time x in seconds
%gives you the appropriate cutoff frequency in Hertz
%this polynomial equation is taken from excel 

%y = -0,0674x2 + 3,6711x + 18,518
%y = 0,0013x3 - 0,1431x2 + 4,7536x + 14,353 more sohisticated
%F = -1E-05*x.^4 + 0.0027*x.^3 - 0.188*x.^2 + 5.2852*x + 12.478;
F = 0.0013*x.^3 - 0.1431*x.^2 + 4.7536*x + 14.353;

end

%there is a fuckin problem here !!!!!!
%from 28m to 78m, the freq decreased
%this function is then unpredictable
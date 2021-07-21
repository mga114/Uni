clc
all clear
%this question constructs a tridiagonal matrix of size mat_size
%and returns the solution to the system of equations given by the 
%equation AX=d, where d is a random vector of length mat_size

%note that we run the formula trials_num many times so that we can
%average the time taken for the computer to process
mat_size = 50000;
%a and b are used for the values in the matrix A, a is used in the 
%main diagonal and b is used for the values above and below all a values
a=1.2;
b=-0.1;
%matrix constructor
d = randi(10,mat_size,1);
%note that we are sparsing the matrix so that the computer has to do 
%much less work
S = 1.2 * eye(mat_size);
A = sparse(S);
trials_num = 1; %number of trials to run
for n = 1:trials_num
    startTime=cputime;
    for i =1:length(A)
        if(i > 1)
            A(i, i-1) = b;
        end
        if(i < length(A))
            A(i, i+1) = b;
        end
    end
    %computing and displaying solutions
    X = A\d
    %calculating total time operations took
    endTime=cputime;
    time(n)=abs(endTime-startTime);
end

total_time = sum(time)/trials_num
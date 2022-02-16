Board_size = input("what size of the game do you want to play(enter a number between 10 and 13):");
X = [10 11 12 13];
%checks to see if the number lies between 10 and 13 inclusive
for i = 1:120
    if Board_size~= X(1)&& Board_size~=X(2)&& Board_size~= X(3)&& Board_size~= X(4)
       fprintf("Invalid Input!");
       Board_size = input('enter a whole number between 10 to 13:');
    end
end
board = zeros(Board_size);%creates the board size by preallocating
%choosing a random place to put the bomb in the array board
Bombs2hide = round(Board_size*1.25) ;
Bomb = "@";
r = randi(length(board));
c = randi(length(board));
board(r,c) = Bomb;
 while counting(board) < Bombs2hide%function is used to check
     %the bombs equal the Bombs decided to hide
        board(r,c) = Bomb;
        r = randi(length(board));
        c = randi(length(board));
 end
 



%this part of the board is the hidden board
%not visible to the user
 Bombshidden = counting(board);
 [rows,cols] = size(board);
 %iterates over the first row and column 2 to second last column
 for row = 1
     %adds one if it finds a bomb near it
     for col = 2:cols-1
           if isnan(board(row,col))
             board(row+1,col+1)=board(row+1,col+1)+1;
             board(row+1,col)=board(row+1,col)+1;
             board(row+1,col-1)= board(row+1,col-1)+1;
             board(row,col+1) = board(row,col+1)+1;
             board(row,col-1)=board(row,col-1)+1;
           end
     end
 end
 %iterating over the last row now ,same columns as before
 for row = rows
     %adds one if it finds a bomb near it
         for col = 2:cols-1
              if isnan(board(row,col))
             board(row-1,col-1)=board(row-1,col-1)+1;
             board(row-1,col)=board(row-1,col)+1;
             board(row-1,col+1)=board(row-1,col+1)+1;
             board(row,col+1) = board(row,col+1)+1;
             board(row,col-1)=board(row,col-1)+1;
              end
            
                  
         end
 end
%now we start with the column 1, row 2 to second last 
 for col = 1
     %adds one if it finds a bomb near it
         for row = 2:rows-1
             if isnan(board(row,col))
             board(row+1,col)=board(row+1,col)+1;
             board(row-1,col)=board(row-1,col)+1;
             board(row-1,col+1)=board(row-1,col+1)+1;
             board(row,col+1) = board(row,col+1)+1;
            
             board(row+1,col+1)=board(row+1,col+1)+1;
            
             end
         end
 end
  for col = cols%last column iteration
      %adds one if it finds a bomb near it
         for row = 2:rows-1
             if isnan(board(row,col))
             board(row+1,col-1)= board(row+1,col-1)+1;
             board(row-1,col-1) = board(row-1,col-1)+1;
             board(row,col-1)=board(row,col-1)+1;
             board(row-1,col)=board(row-1,col)+1;
             board(row+1,col)=board(row+1,col)+1;
             end
         end
  end
  %iteration for the rest of the board except the corners
  for row = 2:rows-1
      
      for col = 2:cols-1
          if isnan(board(row,col))
             board(row+1,col-1)= board(row+1,col-1)+1;
             board(row-1,col-1) = board(row-1,col-1)+1;
             board(row,col-1)=board(row,col-1)+1;
             board(row-1,col)=board(row-1,col)+1;
             board(row+1,col)=board(row+1,col)+1;
             board(row,col+1) = board(row,col+1)+1;
             board(row+1,col+1)=board(row+1,col+1)+1;
          end
      end
  end
  %finally the corners 
  if isnan(board(1,1))
      board(1,2) = board(1,2)+1;
      board(2,1) = board(2,1)+1;
      board(2,2) = board(2,2)+1;
  end
  if isnan(board(rows,1))
      board(rows,2)=board(rows,2)+1;
      board(rows-1,1)=board(rows-1,1)+1;
      board(rows-1,2)=board(rows-1,2)+1;
  end
  if isnan(board(1,cols))
      board(1,cols-1)= board(1,cols-1)+1;
      board(2,cols)=board(2,cols)+1;
      board(2,cols-1)=board(2,cols-1)+1;
  end
  if isnan(board(rows,cols))
      board(rows-1,cols) = board(rows-1,cols)+1;
      board(rows-1,cols-1)=board(rows-1,cols-1)+1;
      board(rows,cols-1)=board(rows,cols-1)+1;
  end
  
  %this is the board that the user will be seeing at the first instance
  yourBoard = zeros(Board_size);


fprintf('  ');
for k = 1:cols
    if k<10
    
    fprintf('    %d',k);
    elseif k>=10
        fprintf('   %d',k);
    end
     
    
end    
fprintf('\n');
for l = 1:rows
    if l< 10
    fprintf(' ');
    fprintf('%d    %d    ',l,yourBoard(1:length(yourBoard)));
    fprintf('\n') 
    else
    fprintf('%d    %d    ',l,yourBoard(1:length(yourBoard)));
    fprintf('\n') 
    end
end
%first time the user is asked to enter a guess

fprintf('which 0 do you want to open:\n')

fprintf("Enter the row(from 1to %d) ",rows);
playRow = input(':');
fprintf("Enter the col(from 1 to %d) ",cols);
playCol = input(':');
yourBoard(playRow,playCol) = board(playRow,playCol);
if isnan(yourBoard(playRow,playCol))
    disp("YOU lose, try again");
    
elseif yourBoard(playRow,playCol) == 0
    yourBoard(playRow,playCol) = "e";
end
if ~isnan(board(playRow,playCol))
    fprintf('  ');
for y = 1:cols
    if y<10
    
    fprintf('    %d',y);
    elseif y>=10
        fprintf('   %d',y);
    end
     
    
end    
fprintf('\n');
for z = 1:rows
    if z< 10
    fprintf(' ');
    fprintf('%d   ',z);
    for a = 1:cols
        if isnan(yourBoard(z,a))
            fprintf('     ');
        else
        fprintf(" %d   ",yourBoard(z,a));
        end
    
    end
    else
    fprintf('%d    ',z);
    for a = 1:cols
        if isnan(yourBoard(z,a))
            fprintf('     ');
        else
        fprintf("%d    ",yourBoard(z,a));
        end
    
    
    end
    end
    fprintf('\n') 
end
end

while ~isnan(board(playRow,playCol))
nextstep = input('enter 99 to use flag function or press 2:');
if nextstep == 99
    fprintf("which zero do u want to flag as a bomb:");
    S=input("Row here:");
    D = input("corresponding column now:");
    yourBoard(S,D) = 99;
         fprintf('  ');
for y = 1:cols
    if y<10
    
    fprintf('    %d',y);
    elseif y>=10
        fprintf('   %d',y);
    end
     
    
end    
fprintf('\n');
for z = 1:rows
    if z< 10
    fprintf(' ');
    fprintf('%d   ',z);
    for a = 1:cols
        if isnan(yourBoard(z,a))
            fprintf('     ')
        elseif yourBoard(z,a) == 99
            fprintf(" %d  ",yourBoard(z,a));
        else
        fprintf(" %d   ",yourBoard(z,a));
        end
    
    end
    else
    fprintf('%d    ',z);
    for a = 1:cols
        fprintf("%d    ",yourBoard(z,a));
    
    
    end
    end
    fprintf('\n') 
end

    
    

elseif nextstep ~=99
    

fprintf('which 0 do you want to open:\n')
fprintf("Enter the row(from 1to %d ",rows);
playRow = input(':');
fprintf("Enter the col(from 1 to %d ",cols);
playCol = input(':');
yourBoard(playRow,playCol) = board(playRow,playCol);


if isnan(yourBoard(playRow,playCol))
   fprintf("you stepped on a bomb: Game is Over\n")
   disp (board)
elseif yourBoard(playRow,playCol)== 0    
    yourBoard(playRow,playCol)= 0+"E";
    fprintf('  ');
for y = 1:cols
    if y<10
    
    fprintf('    %d',y);
    elseif y>=10
        fprintf('   %d',y);
    end
     
    
end    
fprintf('\n');
for z = 1:rows
    if z< 10
    fprintf(' ');
    fprintf('%d   ',z);
    for a = 1:cols
        if isnan(yourBoard(z,a))
            fprintf('     ')
        else
        fprintf(" %d   ",yourBoard(z,a));
        end
    
    end
    else
    fprintf('%d    ',z);
    for a = 1:cols
        fprintf("%d    ",yourBoard(z,a));
    
    
    end
    end
    fprintf('\n') 
end



else
     fprintf('  ');
for y = 1:cols
    if y<10
    
    fprintf('    %d',y);
    elseif y>=10
        fprintf('   %d',y);
    end
     
    
end    
fprintf('\n');
for z = 1:rows
    if z< 10
    fprintf(' ');
    fprintf('%d   ',z);
    for a = 1:cols
        if isnan(yourBoard(z,a))
            fprintf('     ')
        else
        fprintf(" %d   ",yourBoard(z,a));
        end
    
    end
    else
    fprintf('%d    ',z);
    for a = 1:cols
        fprintf("%d    ",yourBoard(z,a));
    
    
    end
    end
    fprintf('\n') 
end


end
end
end







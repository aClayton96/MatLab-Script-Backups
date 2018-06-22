%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Title:        Bubble Sort
% Author:       Ian van der Linde
% Rev. Date:    28-02-18
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [V, numComparisons, numArrayAccesses] = bubbleSort(V)

numComparisons   = 0;
numArrayAccesses = 0;
isSorted         = false;
lastUnknownPos   = length(V);

while(~isSorted)
    
    isSorted    = true;
    
    for currentPos = 1:lastUnknownPos-1
        
        numComparisons       = numComparisons   + 1;
        numArrayAccesses     = numArrayAccesses + 2;
        if(V(currentPos)>V(currentPos+1))
            
            numArrayAccesses = numArrayAccesses + 4;
            temp             = V(currentPos);
            V(currentPos) 	 = V(currentPos+1);
            V(currentPos+1)  = temp;
            
            isSorted         = false;
        end % if
        
    end % for
    
    lastUnknownPos = lastUnknownPos - 1;
    
end % while

end % function
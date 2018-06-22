%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Title:        Selection Sort
% Author:       Ian van der Linde
% Rev. Date:    28-02-18
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [V, numComparisons, numArrayAccesses] = selectionSort(V)

numComparisons   = 0;
numArrayAccesses = 0;

for currentFocus = 1:length(V)
    
    lowestPos    = currentFocus;
    
    for rhs = currentFocus+1:length(V)
        
        numComparisons   = numComparisons   + 1;
        numArrayAccesses = numArrayAccesses + 2;
        if(V(rhs) < V(currentFocus))
            lowestPos    = rhs;
        end % if
        
    end % for
    
    if(lowestPos~=currentFocus)
        temp		     = V(lowestPos);
        V(lowestPos)     = V(currentFocus);
        V(currentFocus)  = temp;
        numArrayAccesses = nunmArrayAccesses + 4;
    end % if
end % for

end % function
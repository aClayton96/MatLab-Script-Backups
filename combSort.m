function [V, numComparisons, numArrayAccesses] = combSort(V)


%Number of comparisons made by the algorithm
numComparisons = 0;

%Number of Array Accesses made by the algorithm
numArrayAccesses = 0;

n = numel(V);

%Gap starts off as the size of the array
gap = n;


%Instead of using 1.3 shrink, use 13 but multiply the gap by 10 before
%using the shrink.
shrink = 13;


%Sorted boolean
sorted = false;

while(~sorted)
    %Set our gap
    gap = floor(gap*10/shrink);
    
    %If the gap is larger than 1, then the list is not sorted, if it is 1,
    %then the list is sorted
    if(gap > 1)
        sorted = false;
    else
        gap = 1;
        sorted = true;
    end
    
    i = 1;
    
    while (i + gap < n)
        numComparisons       = numComparisons + 1;
        numArrayAccesses = numArrayAccesses + 2;
        %If left element larger than right element, swap them
        if(V(i) > V(i + gap))
            %4 Array accesses made, as we create a temp, copy value out,
            %then copy between two array locations, then use the temp to
            %copy in a new value.
            numArrayAccesses = numArrayAccesses + 4;
            temp = V(i);
            V(i) = V(i + gap);
            V(i+gap) = temp;
            sorted = false;
        end
        i = i + 1;
    end
end





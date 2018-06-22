function [nComp, tIndex] = ternarySearchProto(A, target)



%Set index as -1, will be returned if the search fails.
tIndex = -1;

%Number of total comparisons made by algorithm
nComp = 0;

%LeftHandBoundary initialised as 1 (Start of Elements to be searched)
L = 1;

%RightHandBoundary initialised as total number of elements in the array
r = numel(A);

%While everything hasn't been searched
while(L <= r)

    %Find two "Midpoints" to split search space into three
    mid1 = floor(L + (r - L) / 3);
    mid2 = floor(mid1 + (r - L) / 3);
     
    %%Look to see if the 1st midpoint is the target
    nComp = nComp + 1;
    if(A(mid1) == target)
        tIndex = mid1;
        break;
    end
    
    %%Look to see if the 2nd midpoint is the target
    nComp = nComp + 1;
    if(A(mid2) == target)
        tIndex = mid2;
        break;
    end
    
    %If neither midpoint is the target, look to see if the 1st midpoint is
    %larger than target, if it is, the target is in first search space
    if (A(mid1) > target)
            L = L;
            r = mid1;
            
    %If midpoint 2 is smaller than the target, then the target is in the
    %third search space
    elseif(A(mid2) < target)
        L = mid2 + 1;
        r = r;
        
    %If it is in neither 1st, nor last, then it must be in the middle
    %search space
    else
        L = mid1;
        r = mid2;
    end
end
            
            
    
    
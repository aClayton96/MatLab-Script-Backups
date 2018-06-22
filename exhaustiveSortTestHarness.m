%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Title:        Exhaustive Sort Algorithm Test Harness: * Change Line 22! *
% Author:       Ian van der Linde
% Rev. Date:    28-02-18
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
close all;
clc;

maxArrayLength   = 10;

for currentArrayLength = 1:maxArrayLength;

    permutationArray = perms(1:currentArrayLength);
    
    fprintf('\nArray Length Being Tested: %2d (with %d Permutations)', currentArrayLength, size(permutationArray,1));
    for currentPermutation = 1:length(permutationArray)     
        
      currentArray = permutationArray(currentPermutation,1:currentArrayLength);
      
      [~, NC(currentPermutation), NAA(currentPermutation)] = combSort(currentArray);
    
    end % for
    
    BEST_numComparisons(currentArrayLength)    = min(NC);
    BEST_numArrayAccesses(currentArrayLength)  = min(NAA);
    
    AVG_numComparisons(currentArrayLength)     = mean(NC);
    AVG_numArrayAccesses(currentArrayLength)   = mean(NAA);
    
    WORST_numComparisons(currentArrayLength)   = max(NC);
    WORST_numArrayAccesses(currentArrayLength) = max(NAA);
    
end % for

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Display Results
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure;
subplot(1,2,1);
plot(1:maxArrayLength, BEST_numComparisons,  'g', 'LineWidth',2);hold on;
plot(1:maxArrayLength, BEST_numComparisons,  'ko');
plot(1:maxArrayLength, AVG_numComparisons,   'y', 'LineWidth',2);
plot(1:maxArrayLength, AVG_numComparisons,   'ko');
plot(1:maxArrayLength, WORST_numComparisons, 'r', 'LineWidth',2);
plot(1:maxArrayLength, WORST_numComparisons, 'ko');

xlabel('Array Length', 'FontSize', 14);
ylabel('Number of Comparisons', 'FontSize', 14);
xlim([1 maxArrayLength]);
ylim([0 max(WORST_numComparisons)]);
axis square;

subplot(1,2,2);
plot(1:maxArrayLength, BEST_numArrayAccesses,  'g', 'LineWidth',2);hold on;
plot(1:maxArrayLength, BEST_numArrayAccesses,  'ko');

plot(1:maxArrayLength, AVG_numArrayAccesses,   'Y', 'LineWidth',2);
plot(1:maxArrayLength, AVG_numArrayAccesses,   'ko');

plot(1:maxArrayLength, WORST_numArrayAccesses, 'r', 'LineWidth',2);
plot(1:maxArrayLength, WORST_numArrayAccesses, 'ko');

xlabel('Array Length', 'FontSize', 14);
ylabel('Number of Array Accesses', 'FontSize', 14);
xlim([1 maxArrayLength]);
ylim([0 max(WORST_numArrayAccesses)]);
axis square;

print -f1 -r300 -dbmp CombSortSuccessful.bmp



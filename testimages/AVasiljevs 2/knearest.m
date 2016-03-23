function [ classification ] = knearest( manmade , natural , k)
%This function implements part of  the k-nearest algorithm

manmade = manmade(1:k);
natural = natural(1:k);
nearestVec = manmade;
numOfManMade = k;
numOfNatural  = 0;

% q is used to traverse the natural vector
for q = 1:length(natural)
    for w = 1:length(nearestVec)
        if natural(q) < nearestVec(w)
            nearestVec(w) = natural(q);
            numOfManMade = numOfManMade -1;
            numOfNatural = numOfNatural +1;
            break;
        end
    end
end
if(numOfManMade >  numOfNatural)
    classification  = 'manmade';
else if(numOfNatural > numOfManMade)
        classification = 'natural';
    else
        classification = 'indecisive'
    end
end  
end
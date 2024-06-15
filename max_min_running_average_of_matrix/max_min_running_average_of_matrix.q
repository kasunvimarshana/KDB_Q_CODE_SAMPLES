/ \l max_min_running_average_of_matrix.q

/ Create a sample matrix
matrix: 5 5#10?100 / 5x5 matrix with random integers between 0 and 100

///////////////////////////////////
// result: {(`matrix`maxByRow`minByRow`maxByColumn`minByColumn`maxMatrix`minMatrix`runningAvgByRow`runningMaxByRow`runningMinByRow!(x; maxs x; mins x; maxs each flip x; mins each flip x; max raze x; min raze x; sums[x] % 1 + til count[x]; maxs each x; mins each x))} each matrix
///////////////////////////////////

///////////////////////////////////
// / Define the function to calculate various statistics for a matrix
// statsFunc: {[x] `matrix`runningAvgByRow`runningMaxByRow`runningMinByRow! (x; sums[x]%1+til count x; maxs x; mins x)}
// / Apply the function to the matrix
// result: statsFunc each matrix
///////////////////////////////////

/ Find maximum and minimum by row
maxByRow: max each matrix
minByRow: min each matrix

/ Find maximum and minimum by column
maxByColumn: max each flip matrix
minByColumn: min each flip matrix

/ Find maximum and minimum of the entire matrix
maxMatrix: max raze matrix
minMatrix: min raze matrix

///////////////////////////////////
// / Define functions to calculate running averages, max, and min
// runningAvg: {(sums x) % (1 + til count x)}
// runningAvg: {sums[x]%1+til count[x]}
// runningMax: {maxs x}
// runningMin: {mins x}

// / Calculate running averages, max, and min by row
// runningAvgByRow: runningAvg each matrix
// runningMaxByRow: runningMax each matrix
// runningMinByRow: runningMin each matrix
///////////////////////////////////

/ Calculate running averages by row
// runningAvgByRow: {sums[x]%1+til count[x]} each matrix
runningAvgByRow: {avgs x} each matrix

/ Calculate running max by row
runningMaxByRow: {maxs x} each matrix

/ Calculate running min by row
runningMinByRow: {mins x} each matrix

/ Output the results
result: (`matrix`maxByRow`minByRow`maxByColumn`minByColumn`maxMatrix`minMatrix`runningAvgByRow`runningMaxByRow`runningMinByRow!(matrix; maxByRow; minByRow; maxByColumn; minByColumn; maxMatrix; minMatrix; runningAvgByRow; runningMaxByRow; runningMinByRow))

/ View the result
show result
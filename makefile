
F90 = gfortran
FFLAGS = 
OPTFLAGS = -O0

all:  driver 

ifeq ( $(origin size), undefined )
	CPPFLAGS = 20
else
    CPPFLAGS=$(size)
endif

driver : driver.o
	$(F90) -o driver driver.o

driver.o : driver.f90
	$(F90) -c $(FFLAGS) $(OPTFLAGS) driver.f90

clean:
	rm *.o

run :
	driver | tee testdata.dat
	driver | tee -a testdata.dat
	driver | tee -a testdata.dat
	driver | tee -a testdata.dat
	driver | tee -a testdata.dat
	driver | tee -a testdata.dat
	driver | tee -a testdata.dat
	driver | tee -a testdata.dat
	driver | tee -a testdata.dat
	driver | tee -a testdata.dat
	driver | tee -a testdata.dat
	driver | tee -a testdata.dat
	driver | tee -a testdata.dat
	driver | tee -a testdata.dat
	driver | tee -a testdata.dat
	driver | tee -a testdata.dat
	driver | tee -a testdata.dat
	driver | tee -a testdata.dat
	driver | tee -a testdata.dat
	driver | tee -a testdata.dat

average :
	echo "mydata = read.table(\"testdata.dat\", header=FALSE)" >mean.R 
	echo "mean(mydata[[\"V4\"]])" >>mean.R
	R -q --vanilla -f mean.R
	rm mean.R	


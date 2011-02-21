#!/bin/ksh

######################################################################################
######################################################################################
###
### machine dependant functions : each machine has its own functions
###
######################################################################################
######################################################################################

case $MACHINE in

##############################################################################

    'jade')

    chkdir() { if [ ! -d $1 ] ; then mkdir $1 ; fi ;}

    monthly() { m=$1  ; mm=$(printf "%02d" $m )
       cd $MOYTMPDIR/$year
       chkdir $MOYTMPDIR/$year/$mm
       cd $MOYTMPDIR/$year/$mm
       ln -s $P_S_DIR/$year/*y${year}m${mm}d??*.nc .
       for typ in $TYP_LIST ; do
         $CDFTOOLS/cdfmoy ${CONFCASE}_y${year}m${mm}d??_${typ}.nc 
         mv cdfmoy.nc ${CONFCASE}_y${year}m${mm}_${typ}.nc
         case $typ in 
          gridT | gridU | gridV | gridW  ) 
             mv cdfmoy2.nc ${CONFCASE}_y${year}m${mm}_${typ}2.nc ;;
         esac
         \rm ${CONFCASE}_y${year}m${mm}d??_${typ}.nc
       done ;}

    monthlyvt() { m=$1  ; mm=$(printf "%02d" $m )
       cd $VTTMPDIR/$year
       chkdir $VTTMPDIR/$year/$mm
       cd $VTTMPDIR/$year/$mm
       ln -s $P_S_DIR/$year/${CONFCASE}_y${year}m${mm}d??_grid[UVT].nc .
       taglist=''
       for f in ${CONFCASE}_y${year}m${mm}d??_gridT.nc ; do
         tag=$(echo ${f%_gridT.nc} | awk -F_ '{ print $2 }' ) ; taglist="$taglist $tag"
       done
         $CDFTOOLS/cdfvT ${CONFCASE} $taglist
         mv vt.nc ${CONFCASE}_y${year}m${mm}_VT.nc
         \rm ${CONFCASE}_y${year}m${mm}d??_grid[UVT].nc ; }

    annual() { cd $MOYTMPDIR/$year
       for typ in $TYP_LIST ; do
        for m in $(seq 1 12 ) ; do
          mm=$(printf "%02d" $m )
          ln -sf $mm/${CONFCASE}_y${year}m${mm}_${typ}.nc .
          ln -sf $mm/${CONFCASE}_y${year}m${mm}_${typ}2.nc .
        done
        $CDFTOOLS/cdfmoy_weighted ${CONFCASE}_y${year}m??_${typ}.nc
        mv cdfmoy_weighted.nc ${CONFCASE}_y${year}_${typ}.nc
        case $typ in 
         gridT | gridU | gridV | gridW  ) 
           $CDFTOOLS/cdfmoy_weighted ${CONFCASE}_y${year}m??_${typ}2.nc
           mv cdfmoy_weighted.nc ${CONFCASE}_y${year}_${typ}2.nc ;;
        esac
        \rm -f ${CONFCASE}_y${year}m??_${typ}.nc
        \rm -f ${CONFCASE}_y${year}m??_${typ}2.nc
       done ; }

    annualvt() { cd $VTTMPDIR/$year
        typ=VT
        for m in $(seq 1 12 ) ; do
          mm=$(printf "%02d" $m )
          ln -sf $mm/${CONFCASE}_y${year}m${mm}_${typ}.nc .
        done
        $CDFTOOLS/cdfmoy_weighted ${CONFCASE}_y${year}m??_${typ}.nc
        mv cdfmoy_weighted.nc ${CONFCASE}_y${year}_${typ}.nc
        \rm -f ${CONFCASE}_y${year}m??_${typ}.nc ; }

    echo "functions for $MACHINE successfully loaded" ;;

    'ulam' | 'vargas' )

    chkdir() { if [ ! -d $1 ] ; then mkdir $1 ; fi ;}

    # chkdirg  path : check existence of directory path  on (remote) archiving machine. If it does not exist, create it.
    chkdirg() { rsh gaya -l $REMOTE_USER " if [ ! -d $1 ] ; then mkdir $1 ; fi " ; }

    # getmonth  mm type : retrieve all 5 days average files for month mm and grid type 'type', 
    # corresponding to current year, current confcase.A
    #                     ex: getmonth 04 gridU  : retrieve all april files for gridU
    getmonth() { for f  in $( rsh gaya -l $REMOTE_USER ls $P_S_DIR/$year/${CONFCASE}_y${year}m${1}\*_$2.nc )  ; do
                     mfget -u $REMOTE_USER $f ./
                 done  ; }
    # putmonth mm type : write back monthly mean for month mm type 'type' on remote machine in -MEAN/YEAR/ directory.
    #                    also move the localfile to local MONTHLY dir for further annual mean computing

    putmonth() { mfput -u $REMOTE_USER cdfmoy.nc $MEANDIR/$year/${CONFCASE}_y${year}m${1}_$2.nc ;\
                 mv cdfmoy.nc ../${CONFCASE}_y${year}m${1}_$2.nc ; } #\rm ${CONFCASE}_y${year}m${1}d??_$2.nc ; }

    # putmonth2 mm type : write back monthly quadratic  mean for month mm type 'type' on remote machine in -MEAN/YEAR/ dir
    #                    also move the localfile to local MONTHLY dir for further annual mean computing
    putmonth2() { mfput -u $REMOTE_USER cdfmoy2.nc $MEANDIR/$year/${CONFCASE}_y${year}m${1}_${2}2.nc ; \
                  mv cdfmoy2.nc ../${CONFCASE}_y${year}m${1}_${2}2.nc ; }

    # putannual type : write annual MEAN to remote -MEAN dir, in the corresponding year.
    putannual() { mv cdfmoy_weighted.nc ${CONFCASE}_y${year}_$1.nc
                  mfput -u $REMOTE_USER ${CONFCASE}_y${year}_$1.nc  $MEANDIR/$year/${CONFCASE}_y${year}_$1.nc ;}

    # putvtmonth mm : write back monthly mean for month mm type 'VT' on remote machine in -MEAN/YEAR/ directory.
    #                    also move the localfile to local MONTHLY dir for further annual mean computing
    putvtmonth() { mfput -u $REMOTE_USER vt.nc $MEANDIR/$year/${CONFCASE}_y${year}m${1}_VT.nc ; \
                   mv vt.nc ../${CONFCASE}_y${year}m${1}_VT.nc ; } #\rm ${CONFCASE}_y${year}m${1}d??_grid[UVT].nc ; }

    # putvtannual type : write annual MEAN to remote -MEAN dir, in the corresponding year.
    putvtannual() { mv cdfmoy_weighted.nc ${CONFCASE}_y${year}_VT.nc ;
                    mfput -u $REMOTE_USER ${CONFCASE}_y${year}_VT.nc  $MEANDIR/$year/${CONFCASE}_y${year}_VT.nc ; }


    ### META functions :
    monthly() { mm=$1  
       cd $TMPDIR/$MOYTMPDIR/$year
       chkdir $TMPDIR/$MOYTMPDIR/$year/$mm
       cd $TMPDIR/$MOYTMPDIR/$year/$mm

       for typ in $TYP_LIST ; do
         getmonth $mm $typ
         $CDFTOOLS/cdfmoy ${CONFCASE}_y${year}m${mm}d??_${typ}.nc 
         putmonth $mm $typ
         case $typ in 
          gridT | gridU | gridV | gridW  ) 
             putmonth2 $mm $typ ;;
         esac
       done ;}

    monthlyvt() { mm=$1  
       cd $TMPDIR/$VTTMPDIR/$year
       chkdir $TMPDIR/$VTTMPDIR/$year/$mm
       cd $TMPDIR/$VTTMPDIR/$year/$mm
       
       getmonth $mm gridT ; getmonth $mm gridU ; getmonth $mm gridV
       taglist=''
       for f in ${CONFCASE}_y${year}m${mm}d??_gridT.nc ; do
         tag=$(echo ${f%_gridT.nc} | awk -F_ '{ print $2 }' ) ; taglist="$taglist $tag"
       done
         $CDFTOOLS/cdfvT ${CONFCASE} $taglist
         putvtmonth $mm ; }

    annual() { cd $TMPDIR/$MOYTMPDIR/$year
       for typ in $TYP_LIST ; do
        $CDFTOOLS/cdfmoy_weighted ${CONFCASE}_y${year}m??_${typ}.nc
        putannual $typ
        case $typ in 
         gridT | gridU | gridV | gridW  ) 
           $CDFTOOLS/cdfmoy_weighted ${CONFCASE}_y${year}m??_${typ}2.nc
           putannual ${typ}2 ;;
        esac
       done ; }

    annualvt() { cd $TMPDIR/$VTTMPDIR/$year
        typ=VT
        $CDFTOOLS/cdfmoy_weighted ${CONFCASE}_y${year}m??_${typ}.nc
        putvtannual ; }

    echo "functions for $MACHINE successfully loaded" ;;

    *)
    echo available machines are jade desktop ulam vargas ; exit 1 ;;

esac


#!/bin/ksh

## A script to verify the presence of outputs in the S directory
## Usage : verif_snap.ksh CONFIG CASE YEAR

CONFIG=$1
CASE=$2
YEAR=$3

CONFCASE=$CONFIG-$CASE

cd $SDIR/$CONFIG/$CONFCASE-MEAN/$YEAR

echo "                                                                                                            "
echo "############################################################################################################"
echo "   IN $CONFCASE-MEAN/$YEAR :                                                                                "
echo "                                                                                                            "

##############################################################################
### Check the monthly means

echo "   Monthly files : "

for month in $( seq 1 12 ) ; do
    mm=$( printf "%02d" $month )
    tag=y${YEAR}m${mm}

listgrid=''

    for file in $( ls | grep $tag ) ; do
        grid=$( echo $file | sed -e "s/${CONFCASE}_//" -e "s/${tag}_//" -e "s/.nc//" )
        listgrid=" $listgrid $grid"
    done

echo "      in month $mm : $listgrid are present"
done
echo ""

echo "   Annual files : "

for grid in $listgrid ; do

    if [ -f ${CONFCASE}_y${YEAR}_$grid.nc ] ; then
       echo "      Annual $grid is present "
    fi

done

##############################################################################
### Check the size of file

#problem='no'

# define reference size of grid files from first tag
#jg=0

#echo "   -> Check for size   "
#echo ""

#for grid in $listgrid ; do
#    sizeref[$jg]=$( du ${CONFCASE}_${firsttag}_${grid}.nc | awk '{ print $1 }' )
#    sizeh=$( du -h ${CONFCASE}_${firsttag}_${grid}.nc | awk '{ print $1 }' )
#    echo "      file $grid : $sizeh "
#    jg=$(( $jg + 1 ))
#done 

# loop on other tags
#for tag in $listtag ; do

#    jg=0
#    for grid in $listgrid ; do
#       size[$jg]=$( du ${CONFCASE}_${tag}_${grid}.nc | awk '{ print $1 }' )
#       if [ ! $size[$jg] == $sizeref[$jg] ] ; then
#          echo ""
#          echo "     WARNING : file ${CONFCASE}_${tag}_${grid}.nc looks weird"
#          problem='yes'
#       fi
#       jg=$(( $jg + 1 ))
#    done
#
#done 

#if [ $problem == 'yes' ] ; then
#   echo ""
#   echo "   You seem to have problems with some files"
#else
#   echo ""
#   echo "   Files look OK (from size criterion at least)"
#fi


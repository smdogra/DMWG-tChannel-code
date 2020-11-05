#!/bin/bash

CARDDIR=$(cd $(dirname $0); pwd)
echo $CARDDIR
for MMED in 100
do
    for MDM in 1 75 125 200
    do
	[ $MDM -eq $(($MMED)) ] && MDM=$(($MDM-10))
	echo  $MMED $MDM 
	lamb1p0=1

	############# Process Name  p p > X X j
	CARDLABEL2=DMsimp_t-S3D_uR_JChiChi_Mphi-${MMED}_Mchi-${MDM}_Lambda-${lamb1p0}p0
	CARDNAME1=${CARDLABEL1}    
	DIR1=$CARDDIR/${CARDLABEL1}
	mkdir -p $DIR1
	cp $CARDDIR/extramodels.dat $DIR1/${CARDNAME1}_extramodels.dat
	cp $CARDDIR/run_card.dat $DIR1/${CARDNAME1}_run_card.dat
	sed -e "s/_MMED_/$MMED/" -e "s/_MDM_/$MDM/" -e "s/_LAMB_/$lamb1p0/" -e "s/_WIDTH_/AUTO/"  $CARDDIR/customizecards.dat > $DIR1/${CARDNAME1}_customizecards.dat
	sed "s/_NAME_/$CARDNAME1/" $CARDDIR/proc_card1.dat > $DIR1/${CARDNAME1}_proc_card.dat


	############# Process Name p p > Y Y, Y > X j	
	CARDLABEL2=DMsimp_t-S3D_uR_PhiPhiToJJChiChi_Mphi-${MMED}_Mchi-${MDM}_Lambda-${lamb1p0}p0
	CARDNAME2=${CARDLABEL2}    
	DIR2=$CARDDIR/${CARDLABEL2}
	mkdir -p $DIR2
	cp $CARDDIR/extramodels.dat $DIR2/${CARDNAME2}_extramodels.dat
	cp $CARDDIR/run_card.dat $DIR2/${CARDNAME2}_run_card.dat
	sed -e "s/_MMED_/$MMED/" -e "s/_MDM_/$MDM/" -e "s/_LAMB_/$lamb1p0/" -e "s/_WIDTH_/AUTO/"  $CARDDIR/customizecards.dat > $DIR2/${CARDNAME2}_customizecards.dat
	sed "s/_NAME_/$CARDNAME2/" $CARDDIR/proc_card2.dat > $DIR2/${CARDNAME2}_proc_card.dat

    done
done

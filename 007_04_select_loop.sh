#!bin/sh

select DRINK in tea cofee water juice apple all none
do
    case $DRINK in
        tea|coffee|water|all)
            echo "go to canteen"
        ;;
        juice|apple)
            echo "available at home"
        ;;
        none)
            break
        ;;
        *)
            echo "ERROR: Invalid selection"
        ;;
    esac
done


# echo "----------"
# a=10

# until [ $a -lt 10 ]
# do
#    echo $a
#    a=`expr $a + 1`
# done
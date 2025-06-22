
#-ic command is used to find and print the number of line matches while ignoring case distinctions in both the pattern and the input files.
#The -i option makes the search case-insensitive, meaning that it will match patterns regardless of whether they are in uppercase or lowercase.
#The -c option counts the number of matching lines rather than printing them.
#Together, grep -ic will count how many times a pattern appears in the input files, ignoring case differences

# -eq = equal / -gt = greater / 

value=$(ip addr show | grep -v LOOPBACK | grep -ic mtu)

if [ $value -eq 1 ]
then
        echo "1 active network adapter"
elif [ $value -gt 1 ]
then
        echo "multiple adapters"
else
        echo "no adapter found"
fi
~                                                                               
~                                                                               
~           

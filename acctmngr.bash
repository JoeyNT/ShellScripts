#!bin/bash/

#Author: JoeyNT
#Shell script to facilitate, create, delete, and add accounts.

help()
{
cat << EOF
        Usage: acctmngr < options > file_name users_name CRNs
        Exemple: acctmngr -c -f myfile.txt 39321 34324 jlin
   Options:
                -h: Display this help
                -d: Delete accounts
                -c: Create accounts
                -s: Show accounts
                -f: Use file data
EOF
}

show_accts()
{
   getent passwd | cut -d: -f1 | sort
}

OPTIONS=$1

Aflag=false
Aflag_file=none

while [ $# -gt 0 ]; do
 echo $2
  case $2 in
      -f )
      Aflag=true
      shift
      Aflag_filename=$2
      cat $Aflag_filename >> scratch_file
      ;;
      * )
      if [[ $1 =~ ^[0-9]{5}$ ]]; then
        grep "c""$1" group | cut -d: -f4 | tr ',' '\n' >> scratch_file
      fi
      if [[ $1 =~ ^[a-zA-Z]${3,} ]]; then
              echo $1 >> scratch_file
      fi
      ;;
  esac
shift
done

sort_scratch()
{
sort scratch_file | uniq > sorted_scratch
}

add_usrs()
{
while read usrs; do sudo useradd -p $(openssl -l changeme)
""JC""$usrs""; done < sorted_scratch
}

delete_accnt()
{
while read accnt; do sudo userdel -r ""JC""$accnt"; done < sorted_scratch
}

for OPTION in $OPTIONS; do
 if [[ "$OPTIONS" =~ ^-c$ ]]; then
        add_usrs result_add_usrs

 elif [[ "$OPTIONS" =~ ^-d$ ]]; then
        delete_accnt result_delete_accnt

 elif [[ "$OPTIONS" =~ ^-s$ ]]; then
        show_accts result_show_accts
        echo $result_show_accts

 elif [[ "$OPTIONS" =~ ^-h$ ]]; then
        help help_result
        echo $help_result
 fi
Done
(END)


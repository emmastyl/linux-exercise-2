#PART 1

#emacs -nw pattern.sh

#1)
wget http://139.91.162.50/bioinf2018/fasta.fa #κατεβαίνει ένα αρχείο fasta.fa

#2)
sed '/>/d' fasta.fa  > seqs_without_names.txt #επειδή θέλω να μετρήσω τα indels '-' στις αλληλουχίες, πρέπει να αφαιρέσω τους τίτλους, ό,τι ξεκινάει δηλαδή με '>', για να μην υπολογιστούν τα '-' που υπάρχουν στους τίτλους. Το seqs_without_names.txt έχει 5030 γραμμές (cat -n seqs_without_names.txt), ενώ το fasta.fa έχει 10000 γραμμές (cat -n fasta.fa).
grep '-' seqs_without_names.txt | wc -l #2578, πάνω από τις μισές αλληλουχίες

#3)
grep -e '--' seqs_without_names.txt  | wc -l #2491, το egrep δε μου δούλευε, γιατί; Σε περίπτωση που κάποιος τίτλος έχει '--', για αυτό και τα ψάχνω από το seqs_without_names.txt

#4)
egrep -i '[ACGT]-[ACGT]-[ACGT]' seqs_without_names.txt | wc -l #28, βάζω grep -i για να είναι case insensitive, αφού υπάρχουν αλληλουχίες γραμμένες με μικρά γράμματα

#5)
grep -v '-' seqs_without_names.txt | wc -l #2452, αν έψαχνα στο fasta.fa, θα υπολογιζόντουσαν και οι τίτλοι που δεν είχαν '-'

#6)
grep -o -i 'GGG[CT][AG]' seqs_without_names.txt | less # ή |xclip, αναλόγως αν θέλω να τα κάνω επί τόπου paste σε ένα online seqlogo πχ, πάλι με case insensitive για να υπολογίσω τα περισσότερα

#PART 3

grep '^>' fasta.fa > seq_names_only.txt
grep 'hg19' seq_names_only.txt | wc -l #50


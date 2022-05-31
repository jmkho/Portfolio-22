#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <conio.h>
#include <windows.h>
#include <time.h>
#include <assert.h>
#include <sys/types.h>	//datstruct
#include <dirent.h>		//datstruct	

char titlesong[55];				//title songs
int allchords;					//chords available

void inputchords();
void mainMainMenu();
void chooseMenu();

void choseMenu1();
void choseMenu11();
void choseMenu12();
void menu121();
void menu123();

void choseMenu2();
void menu22();

void main(){
	system("cls");
	inputchords();
	mainMainMenu();
	chooseMenu();
	
	int ch;
	do {
		ch = getch();
		if (ch == 49) {
			choseMenu1();
		}
		else if (ch == 50) {
			choseMenu2();
		}
		else if (ch == 48){
			printf("Thanks for using this program!\n");
			exit(100);
		}
	} while (1);
}

struct music{
	char notes[5];
	float chords;
}musicnotes[100];

void inputchords(){
	FILE *fpiano = fopen ("pianochords.dl", "r");
	int i=0;
	if (!fopen) {
		perror("");
		exit(-1);
	}
	else {
		while (fscanf(fpiano, "%[^^]^%f%*c", musicnotes[i].notes, &musicnotes[i].chords) != EOF) {
			i++;
		}
		allchords = i;
		fclose(fpiano);
	}
}

void mainMainMenu(){

	printf("\n\n\t\t   ==========\\    ===========|       ======\\      =====\\     ===|     =========\\\n");
	printf("\t\t   ===========\\   ===========|      ========\\     ======\\    ===|    ===========\\\n");
	printf("\t\t   ===|-----==|       ===-----     ==-----===\\    ===|===\\   ===|   =====/  =====|\n");
	printf("\t\t   ===|     ==/       ===|        ===|    ====|   ===| ===\\  ===|   ====/    ====|\n");
	printf("\t\t   ==========/        ===|        ===|    ====|   ===|  ===\\ ===|   ===/      ===|\n");
	printf("\t\t   ===------/         ===|        ============|   ===|   ===\\===|   ===\\      ===|\n");
	printf("\t\t   ===|               ===|        ====----====|   ===|     =====|   ====\\    ====|\n");
	printf("\t\t   ===|               ===|        ===|    ====|   ===|      ====|   =====\\  =====|\n");
	printf("\t\t   ===|           ===========|    ===|    ====|   ===|      ====|    ===========/\n");
	printf("\t\t   ===|           ===========|    ===|    ====|   ===|      ====|    ==========/\n");
	printf("\t\t   ----           ------------    ----    -----   ----      -----     ---------\n\n\n\n");
	
	printf("\t\t ||  |\\\\  ||      //==\\\\      ||==\\\\ ||==\\\\ ||==|| ||===\\\\ ||==\\\\ ||==|| ||\\\\  //|| \n");
	printf("\t\t ||  ||\\\\ ||      ||          ||  || ||  // ||  || ||      ||  // ||  || || \\\\// ||     \n");
	printf("\t\t ||  || \\\\||      ||          ||===  ||===  ||  || ||  === ||===  ||==|| ||  \\/  ||        \n ");
	printf("\t\t ||  ||  \\||      \\\\==//      ||     ||  \\\\ ||==|| ||===|| ||  \\\\ ||  || ||      ||      \n\n\n\n" ); 
	
	printf("\t\t\t\t   Press Any Key To Start Making Your Own Music! ");
	
	Beep(261.63, 90);
	Beep(293.66, 90);
	Beep(329.63, 90);
	Beep(349.23, 90);
	Beep(392, 100);
	Beep(440, 100);
	Beep(493.88, 120);
	Beep(523.25, 150);
	getch();
}

void chooseMenu(){
	system("cls");
	printf("\n\n\t\t\t\t\t1. Create New Music\n");
	printf("\t\t\t\t\t2. View Music Library\n");
	printf("\t\t\t\t\t0. Exit\n");
	printf("\t\t\t\t\t> ");
}

void getInteger(){
	do {
		int ch = getch();
		if (ch == 49) {
			choseMenu11();
			choseMenu1();
		}
		else if (ch == 50) {
			choseMenu12();
		}
		
		else if (ch==13) break;
	} while (1);
}

void choseMenu1(){
	system("cls");
	printf("\n\n");
	printf("\n\t\t C1#       D1#\t\t        F#         G#        A#\t\t       C2#       D2#\n");
	printf("\t_____________________________________________________________________________________________________\n");
	printf("\t|       =====     =====       |       =====     =====     =====       |       =====     =====       | \n");
	printf("\t|       =====     =====       |       =====     =====     =====       |       =====     =====       | \n");
	printf("\t|       =====     =====       |       =====     =====     =====       |       =====     =====       | \n");
	printf("\t|       =====     =====       |       =====     =====     =====       |       =====     =====       | \n");
	printf("\t|       =====     =====       |       =====     =====     =====       |       =====     =====       | \n");
	printf("\t|       =====     =====       |       =====     =====     =====       |       =====     =====       | \n");
	printf("\t|       =====     =====       |       =====     =====     =====       |       =====     =====       | \n");
	printf("\t|       =====     =====       |       =====     =====     =====       |       =====     =====       | \n");
	printf("\t|       =====     =====       |       =====     =====     =====       |       =====     =====       | \n");
	printf("\t|       =====     =====       |       =====     =====     =====       |       =====     =====       | \n");
	printf("\t|       =====     =====       |       =====     =====     =====       |       =====     =====       | \n");
	printf("\t|         |         |         |         |         |         |         |         |         |         |\n");
	printf("\t|         |         |         |         |         |         |         |         |         |         |\n");
	printf("\t|         |         |         |         |         |         |         |         |         |         |\n");
	printf("\t|_________|_________|_________|_________|_________|_________|_________|_________|_________|_________|\n");
	printf("\n\t     C1        D1        E1        F         G         A         B         C2        D2        E2\n\n\n");
	
	printf("\t\t\t\tPress 1 to hear chord sounds\n");
	printf("\t\t\t\tPress 2 to start adding chords\n");

	getInteger();
}

void choseMenu11(){
	char chordchosen[3] = {};
	printf("\n\t\t\tChord you want to listen (one chord per play, use upper case only): ");
	scanf("%[^\n]", chordchosen); getchar();
	
	int i, flag = 0;
	for (i=0; i<allchords; i++){
		if (strcmp(chordchosen, musicnotes[i].notes) == 0 ) {
			Beep (musicnotes[i].chords, 1200);
			flag++;
			break;
		}
	}
	
	if (flag==0) {
		printf("\t\t\tNo chords found! \n");
		Sleep(1000);
	}
}

struct songs {
	char chords[8];
	long int duration;
} lagu[51];

void choseMenu12(){
	system("cls");
	int chordsused = 0, i, j;
	
	printf("\n\n\t\tInput title for your song (max 50 characters): ");
	scanf("%[^\n]", titlesong); getchar();
	
//	strncat(titlesong, ".song", 6);
	
	while (chordsused>50 || chordsused<1){
		printf("\t\tNumber of chords you want to use (max 50): ");
		scanf("%d", &chordsused);
		
		if (chordsused > 50) printf("\t\tToo many! You only can have max. 50 chords.");
		else if (chordsused < 1) printf("\t\tToo little! You only can have min. 1 chords.");
		printf("\n");
	}
	getchar();
	
	printf("\t\tInput your chords from chords below (case sensitive!) \n");
	printf("\t\t\t ___________________________________________________________\n");
	printf("\t\t\t|     |     |     |     |     |     |     |     |     |     |\n");
	printf("\t\t\t|  C1 |  D1 |  E1 |  F  |  G  |  A  |  B  |  C2 |  D2 |  E2 |\n");
	printf("\t\t\t|_____|_____|_____|_____|_____|_____|_____|_____|_____|_____|\n");
	printf("\t\t\t   |     |     |     |     |     |     |     |     |     |\n");
	printf("\t\t\t   | C1# | D1# |     |  F# |  G# |  A# |     | C2# | D2# |\n");
	printf("\t\t\t   |_____|_____|_____|_____|_____|_____|_____|_____|_____|\n");
	
	printf("\n\t\t\t // type 'STOP' to give pauses//");
	printf("\n\t\t\t // type '1' to restart// \n");
	
	for (i=0; i<chordsused; i++){
		printf("\t\t\t%d. ", i+1);
		scanf("%[^\n]", lagu[i].chords);
		getchar();
		
		if (strcmp(lagu[i].chords, "1") == 0) {
			choseMenu12();
		}
		
		else {
			int flag = 0;
			for (j=0; j<allchords; j++){
				if (strcmp (lagu[i].chords, musicnotes[j].notes) == 0) {
					flag++;
					break;
				}
			}
			
			if (flag == 0) {
				printf("\t\t\tChord is not from this program!\n");
				i--;
			}
			else {
				printf("\t\t\tDuration (per millisecond): ");
				scanf("%ld", &lagu[i].duration);
				getchar();
			}
		}
	}
	
	printf("\n\n\t\t\t1. Preview\n");
	printf("\t\t\t2. Restart\n");
	printf("\t\t\t3. Save\n");
	printf("\t\t\t4. Cancel (Back to Main Menu)\n");
	printf("\t\t\t > ");
	
	do {
		int ch = getch();
		if (ch == 49) {
			menu121(chordsused);
		}
		else if (ch == 50) {
			choseMenu12();
		}
		else if (ch == 51){
			menu123(titlesong, chordsused);
		}
		else if (ch == 52){
			main();
		}
		
	} while (1);
}

void menu121(int chordsused){
	int i, j;
	
	for (i=0; i<chordsused; i++){
		for (j=0; j<17; j++){
			if (strcmp(lagu[i].chords, musicnotes[j].notes) == 0) {
				Beep(musicnotes[j].chords, lagu[i].duration);
			}
		}
	}
}

const char* currtime(){
	time_t t;
	time(&t);
	return ctime(&t);
}

void menu123(char titlesong[], int chordsused){
	FILE *savesong = fopen ("songs.int", "a");
	system("cls");
	char name[105];
	printf("\t\t\tTitle: %s\n", titlesong);
	printf("\t\t\tComposer (max. 100 characters): ");
	scanf("%[^\n]", name);
	
	fprintf(savesong, "%s\n", titlesong);
	fprintf(savesong, "%d\n", chordsused);
	int i;
	for (i=0; i<chordsused; i++){
		fprintf(savesong, "%s@%d\n", lagu[i].chords, lagu[i].duration);
	}
	
	fprintf(savesong, "%s", currtime());
	fprintf(savesong, "%s\n", name);
	fprintf(savesong, "!!\n");
	fclose(savesong);
	
	printf("\t\t\tSaving success!\n\t\t\tReturning to main menu..");
	sleep(2);
	main();
}

struct songscreated {
	char titlesong[55];
	int chordsall;
	char notes[52][5];
	int durasi[52];
	char timecreated[50];
	char creator[200];
}all[500];

int songslib(){
	FILE *fop = fopen ("songs.int", "r");
	int i=0, j;
	if (!fop) {
		return -1;
	}
	
	else {
		while (!feof(fop)){
			fscanf(fop, "%[^\n]%*c", all[i].titlesong);
			fscanf(fop, "%d%*c", &all[i].chordsall);
			
			for (j=0; j<all[i].chordsall; j++){
				fscanf(fop, "%[^@]@%d%*c", all[i].notes[j], &all[i].durasi[j]);
			}
			
			fscanf(fop, "%[^\n]%*c", all[i].timecreated);
			fscanf(fop, "%[^\n]%*c!!%*c", all[i].creator);
			
			i++;
		}
		fclose(fop);
		return i;
	}
}

void choseMenu2 (){
	system("cls");
	
	printf("\n\t\t\t\t\tAvailable Songs\n");
	
	int avlb = songslib(), i;
	if (avlb == -1) {
		printf("\t\t\t\t\tNo available songs!\n");
		getch();
		printf("\t\t\t\t\tReturning to main menu..");
		Sleep(1500);
		system("cls");
		main();
	}
	
	else menu22(avlb);
}

void menu22(int avlb){
	int n = 0;
		printf("\n\n%-40s %-30s %s\n", "Title", "Creator", "Time Created");
		printf("____________________________________________________________________________________________________\n");
		while (n<avlb-1){
			printf("%d. %-37s %-30s %s\n", n+1, all[n].titlesong, all[n].creator, all[n].timecreated);
			n++;
		}
		
		printf("\n\n\t\t\t\t\t1. Play Music\n");
		printf("\t\t\t\t\t0. Back\n");
		printf("\t\t\t\t\t> ");
		
		do {
			int check = getch(), musnum = -1, j, k;
			
			if (check == 49){
				printf("\n\t\t\t\t\tPlay Music Number: ");
				
				do {
					scanf("%d", &musnum); getchar();
				} while (musnum < 1 || musnum > avlb);
			
				for (j=0; j<all[musnum-1].chordsall; j++){
					for (k=0; k<allchords; k++){
						if (strcmp(all[musnum-1].notes[j], musicnotes[k].notes) == 0){
							Beep(musicnotes[k].chords, all[musnum-1].durasi[j]);
							break;
						}
					}
				}
				
				system("cls");
				choseMenu2();
			}
			
			else if (check==48){
				system("cls");
				main();
				break;
			}
		} while(1);
}

#include <iostream>
#include <sys/wait.h>
#include <unistd.h>
#include <sys/stat.h>
#include <string.h>
#include<cstring>
#include <fcntl.h>
#include <stdio.h>
#include <string>
#include <sys/types.h>
using namespace std;


/*Assignment 1 Help Code
#include<iostream>
#include<cstring>
#include<unistd.h>
#include<stdlib.h>
#include<sys/wait.h>

using namespace std;
int main()
{
char command[50];
i:	cout << "Enter the Command: ";
cin.getline(command, 50);

if (strcmp(command, "exit") == 0 || strcmp(command, "Exit") == 0)
{
cout << "Shell is exitting !!!\n";
return 1;
}

int id = fork();
if (id > 0)//Parent Process
{
wait(NULL);
cout << "Control returned to Parent Process." << endl;
goto i;
}
else if (id == 0)//child process
{
char **argc = new char*[10];
for (int i = 0; i < 10; i++)
{
argc[i] = new char[20];
}
argc[0][0] = '\0';

int counter = 0;
int k = 0;
for (int i = 0; command[i] != '\0'; i++)
{
if (command[i] == ' ')
{
argc[counter][k] = '\0';
counter++;
k = 0;
}
else
{
argc[counter][k] = command[i];
k++;
}
}
argc[counter][k] = '\0';
argc[++counter] = nullptr;
execvp(argc[0], argc);
cout << "execvp failed to execute\n";
}
else cout << "Fork Failed !!!\n";
}
*/


int main()
{

	string data;// string variable to store Command
	int back_up1 = dup(0); // input backup
	int back_up2 = dup(1); // output backup

	while (1)
	{

		int fd[2]; //array for pipe
		int status = pipe(fd); // creating pipe
		int no_of_pipes = 0;//initialize pipes to zero

		int write = 0;
		int read = 0;

		cout << "Please enter the command : ";
		getline(cin, data); // input from user

		if (data == "exit" || data == "Exit") // terminate if exit is entered
		{
			cout << "Shell is terminating !!!" << endl;
			return 0;
		}

		int start, end, index, k, i; // for tokenization
		start = end = index = k = i = 0;

		bool output_in_file, output_on_pipe, input_from_pipe, input_from_file;//initialize all checks to false
		output_in_file = output_on_pipe = input_from_pipe = input_from_file = false;

		int backup_fd, backup_fd2, backup_fd3, backup_fd4;
		backup_fd = backup_fd2 = backup_fd3 = backup_fd4 = 0;//initialize all to zero
	    //backup_fd  output backup for file,backup_fd2  output backup for pipe
	    //backup_fd3 input backup for pipe,backup_fd4  input backup for file

		for (int q = 0; q < data.length(); q++) //loop to count no of pipes in the given command
		{
			if (data[q] == '|')
			{
				no_of_pipes++;
			}
		}

		int size, x; size = x = 0;

		for (; x < data.size(); x++) // loop to calculate the number of instuctions
		{
			if (data[x] == ' ')
				size++;
		}

		char **tokenized_data;
		tokenized_data = new char *[size + 3]; // allocate the memory according of the desired size

		for (int counterx = 0; counterx <= no_of_pipes; counterx++)
		{

			for (int checker =1; i <= data.size() && checker; i++,checker++) // loop for tokenization
			{
				if (data[i] == ' ' || data[i] == '\0')
				{
					k = 0;
					end = i;
					tokenized_data[index] = new char[end - start + 1]; // allocate the memory according of the desired size

					for (int j = start; j < end; j++)
					{
						tokenized_data[index][k] = data[j];
						tokenized_data[index][k + 1] = '\0';
						k++;
					}

					index++;
					start = i + 1;
				}
				else if (data[i] == '<') // to redirect input from file
				{
					i += 2;
					int z = i;
					int count = 0;
					for (; data[z] != '\0' && data[z] != ' '; count++, z++){}
					char *str = new char[count + 2];

					for (z = 0; data[i] != '\0' && data[i] != ' '; i++)
					{
						str[z] = data[i];
						z++;
					}
					str[z] = '\0';

					backup_fd4 = dup(0);
					read = open(str, O_RDONLY, 0);
					dup2(read, 0); // redirect input

					// output_in_file = true;
					input_from_file = true;
					break;
				}
				else if (data[i] == '|') // to redirect output in pipe
				{
					backup_fd2 = dup(1);
					dup2(fd[1], 1); // redirecting output to pipe

					i += 2;
					start = i;
					close(fd[1]);

					output_on_pipe = true;

					break;
				}
				else if (data[i] == '>') // to redirect output in file
				{
					backup_fd = dup(1);
					i += 2;
					int z = i;
					int count = 0;
					for (; data[z] != '\0' && data[z] != ' '; count++, z++){}

					char *ptr = new char[count + 2];

					for (z = 0; data[i] != '\0' && data[i] != ' '; i++)
					{
						ptr[z] = data[i];
						z++;
					}
					ptr[z] = '\0';

					write = open(ptr, O_CREAT | O_WRONLY, 0666);
					dup2(write, 1); // redirect output to file

					output_in_file = true;
					break;
				}
			}

			tokenized_data[index] = new char[1];

			tokenized_data[index] = NULL; // store null at last index

			//---------------------------------------------------fork start------------------------------------------------------------
			int abc = fork();
			if (abc > 0) // create a child and call execvp command
			{
				wait(NULL);
			}
			else if (abc == 0)
			{
				execvp(tokenized_data[0], tokenized_data);
			}
			else cout << "Fork unsuccessful !!!" << endl;
			//---------------------------------------------------input output restore---------------------------------------------------

			if (output_in_file == true)
			{
				output_in_file = false;
				close(write);
				dup2(backup_fd, 1); // restore
				close(backup_fd);

				dup2(back_up1, 0);
				dup2(back_up2, 1);
			}
			if (input_from_pipe == true)
			{
				input_from_file = false;
				dup2(backup_fd4, 0);
				close(read);
			}
			if (output_on_pipe == true)
			{
				input_from_pipe = true;
				output_on_pipe = false;
				index = 0;
				dup2(backup_fd2, 1); // restore
				backup_fd3 = dup(0);
				dup2(fd[0], 0); // redirecting input to pipe
				close(fd[0]);
				close(fd[1]);
			}
		}
		dup2(back_up2, 1);
		dup2(back_up1, 0);

	}
	cout << "Unexpected Error Occoured" << endl;
	return 0;
}
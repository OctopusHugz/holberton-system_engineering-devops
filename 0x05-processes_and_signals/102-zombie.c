#include <sys/types.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int infinite_while(void);

/**
 * main - this function creates 5 zombie processes
 * Return: 0
 **/

int main(void)
{
	int i = 0;
	pid_t child_pid;

	while (i < 5)
	{
		child_pid = fork();
		if (child_pid == 0)
			return (0);
		printf("Zombie process created, PID: %d\n", child_pid);
		i++;
	}
	infinite_while();
	return (0);
}

/**
 * infinite_while - this function creates 5 zombie processes
 * Return: 0
 **/
int infinite_while(void)
{
	while (1)
	{
		sleep(1);
	}
	return (0);
}

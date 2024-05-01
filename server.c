/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   server.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: iverniho <iverniho@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/04/29 12:58:07 by iverniho          #+#    #+#             */
/*   Updated: 2024/05/01 15:37:50 by iverniho         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "minitalk.h"

void	ft_putchar_fd(char c, int fd)
{
	write(fd, &c, 1);
}

void	ft_btoa(int sig)
{
	static int		i;
	static int		bit;

	if (sig == SIGUSR1)
		i |= (1 << bit);
	bit++;
	if (bit == 8)
	{
		ft_putchar_fd(i, 1);
		bit = 0;
		i = 0;
	}
}

void	ft_putnbr_fd(int n, int fd)
{
	char	res;

	if (n == -2147483648)
		write(fd, "-2147483648", 11);
	else if (n < 0)
	{
		write(fd, "-", 1);
		n = -n;
		ft_putnbr_fd(n, fd);
	}
	else
	{
		if (n > 9)
		{
			ft_putnbr_fd(n / 10, fd);
			ft_putnbr_fd(n % 10, fd);
		}
		else
		{
			res = n + 48;
			write(fd, &res, 1);
		}
	}
}

int	main(int argc, char **argv)
{
	int	pid;

	(void)argv;
	if (argc != 1)
	{
		write(1, "Error\n", 6);
		return (1);
	}
	pid = getpid();
	write(1, "PID: ", 5);
	ft_putnbr_fd(pid, 1);
	write(1, "\n", 1);
	while (argc == 1)
	{
		signal(SIGUSR1, ft_btoa);
		signal(SIGUSR2, ft_btoa);
		usleep(10000);
	}
	return (0);
}

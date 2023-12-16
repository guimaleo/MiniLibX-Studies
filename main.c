#include "minilibx-linux/mlx.h"
#include "include/window.h"

int	main(void)
{
	t_win	program;

	program = summon_window(300, 300, "<PROGRAM NAME>");
	if (!program.mlx_ptr || !program.win_ptr)
		return (-1);
	mlx_loop(program.mlx_ptr);
	return (0);
}

#include "../minilibx-linux/mlx.h"
#include "../include/window.h"

t_win	summon_window(int w, int h, char *name)
{
	void	*mlx_ptr;

	mlx_ptr = mlx_init();
	return ((t_win) {mlx_ptr, mlx_new_window(mlx_ptr, w, h, name), w, h});
}

# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hel-makh <hel-makh@student.1337.ma>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/23 15:55:47 by hel-makh          #+#    #+#              #
#    Updated: 2023/02/04 13:23:42 by hel-makh         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

DOCKER_COMPOSE	=	srcs/docker-compose.yml

all:	build up

build:
		sudo docker-compose -f $(DOCKER_COMPOSE) build

up:
		sudo docker-compose -f $(DOCKER_COMPOSE) up

clean:	down rmi rmv

down:
		sudo docker-compose -f $(DOCKER_COMPOSE) down

rmi:
		sudo docker images -q | xargs sudo docker rmi -f

rmv:
		sudo docker volume ls -q | xargs sudo docker volume rm

rmn:
		sudo docker network ls -q | xargs sudo docker network rm 2>/dev/null

fclean:	clean
		sudo docker image prune -a

re:		fclean all
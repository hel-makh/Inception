# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hel-makh <hel-makh@student.1337.ma>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/23 15:55:47 by hel-makh          #+#    #+#              #
#    Updated: 2023/01/25 13:11:19 by hel-makh         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

DOCKER_COMPOSE	=	srcs/docker-compose.yml

all:	build up

build:
		sudo docker-compose -f $(DOCKER_COMPOSE) build

up:
		sudo docker-compose -f $(DOCKER_COMPOSE) up

down:
		sudo docker-compose -f $(DOCKER_COMPOSE) down

rmi:
		sudo docker images -q | xargs sudo docker rmi -f

fclean:	down rmi

re:		fclean all
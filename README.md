# Synchronisation

Rendu du cours d'info606: Synchronisation des processus.

Rendu réalisé par Mauti Enzo et Vaglio Lisa

Notre projet consiste en la création d'un système émulant un ou plusieurs tournois de judo.

Le rendu est composé des classes contenue dans le répertoire `lib/synchronisation`.

Chaque classe contient un descriptif de ce à quoi elle correspond et comment chacune fonctionne.

Les classes contenues dans le répertoire `lib/synchronisation/setup` permettent de créer rapidement des tests pour les personnes voulant essayer cette gem.

Quelques règles que nous avons appliqué à ce projet pour éviter les bugs et problèmes de compréhension:

- Lors d'un tournoi de judo, il y a généralement 2 ou 3 arbitres qui gèrent le match sur le terrain, et 1 à 2 arbitres qui gèrent la table d'arbitrage. Les arbitres sur le terrain (que nous avons appeler arbitres de terrains) se relaient pour arbitrer un à 2 matchs de suite. Pour rendre la compréhension plus simple, nous avons décider que, quoi qu'il se passe, 3 arbitres de terrains sont présents et sont assignés définitivement à un terrain. Un seul arbitre de table sera présent. Les arbitres se relaient tous les matchs.
- Les tournois sont TOUS des tournois à éliminations directe. Pas de règles de repéchage, les matchs se font dans l'ordre et chaque tours attend que le tour précedent ai entièrement finis.
- Les joueurs doivent attendre un certains temps entre les matchs, nous avons rendu ce temps obligatoire pour tous. Ceci correspond avec les paramètres actuels à un délai de 20 secondes entre chaque tour (délai décompté entre la fin du dernier match d'un tour et le début du tour suivant).

Pour le bon fonctionnement du projet nous avons utilisé des sémaphores et des threads. 
Dans la classe Tournoi, nous avons utilisé des sémaphores pour contrôler l'accès aux terrains disponibles pour les matchs. Quand un match commence il obtient l'accès à un terrain qu'il libère une fois terminé rendant le terrain de nouveau disponible.
Nous avons également utilisé des threads pour que les matchs s'exécutent en parallèle des autres. 
Dans la classe Terrain, nous avons utilisé des sémaphores pour assigner les arbitres à un seul match à la fois. De plus, le sémaphore associé au terrain lui-même garantit qu'un seul match peut se dérouler sur ce terrain à la fois. 
Dans la classe Match, nous avons utilisé des sémaphores pour gérer les terrains. Lorsqu'un match est prêt à être joué, il doit obtenir un accès aux terrains. Le terrain est libéré une fois le match terminé.
Dans la classe Joueur, nous avons utilisé des sémaphores pour synchroniser l'accès aux ressources partagées, les données des joueurs. Chaque joueur est associé à un sémaphore qui garantit un accès exclusif à ses données. 

## Installation

Installez les fichiers de la gem avec la commande suivante:

    $ git clone https://github.com/Poutchy/synchronisation.git

Une fois cela fait, installez la gem en tant que telles dans votre système:

    $ gem install --local path_to_gem/filename.gem

## Usage

Cette gem vous permet l'usage de toutes les classes décrites dans sa librairie, et le fichier de tests de tournoi permet un apperçu de son fonctionnement.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Poutchy/synchronisation.

fibonacci-plant
===============
![Fibonacci plant screenshot](https://raw.github.com/oluckyman/fibonacci-plant/master/screen_shot.png)

It is a Processing sketch that simulates how the plant sprouts.  
When sprouting the leaves of the plant sets the Golden Angle (~137.508°) between the each other.

## Phyllotaxis
**Phyllotaxis** is a term used for the patterns that emerge in the growth of plants.  
Spiral phyllotaxis is observed in the heads of sunflowers, in pine-cones and pineapples, and in a variety of other plants.

## Fibonacci phyllotaxis
The number of visible spirals (parastichies) in spiral arrangements are most often Fibonacci numbers (1, 1, 2, 3, 5, 8, 13, 21 ...) and the angle between successive leaves is close to the Golden Angle - about 137.508°. This frequent type of pattern is called **Fibonacci phyllotaxis**.

## Why Fibonacci phyllotaxis is so spread?
The Nature doesn't know anything about Fibonacci, mathematics or angles. Instead, she knows some simple principle due to which the sprouts of a plant get the maximum of light and rain and arrange the Golden Angle between the leaves.

## About this model
My intention was to reveal how the Fibonacci phyllotaxis emerges naturally during the simulation of the growth of a plant.  
Designing this model instead of assigning explicit Golden Angle between the two new leaves I had set the following principle:
 - A new leaf is formed periodically in the center of the stem (with some indeterminacy).
 - Once it is formed, the leaf moves away from the center arranging a certain angle.
 - The next leaf choses his direction of growth in a way to be as far as possible from the existing leaves.

Launching this model you will observe how the angle between the successive leaves gets close to the Golden Angle.

### Launching
The program requires [Processing 2.0](http://processing.org) or later.  
In the Processing app click `open` and navigate to `fibonacci_plant\fibonacci_plant.pde`  
Then click the `run` button.

### UI
The blue circle in the center is a stem cortex.  
A new leaf emerges when the previous one has grown away from the stem.  
A yellow dot on the stem is marking the direction of growth of the consequent leaf.  
The red colored list on your left shows the angles between the leafs. The proportion in relation to the Golden Angle is shown in brackets.
After a while the parastichies emerge: five yellow and eight blue.

### Controls
*left mouse* - hold to pause, drag to move.  
*right mouse* - click (and hold) to zoom (top of the screen to zoom in; bottom of the screen to zoom out).  

* * *

fibonacci-plant (rus)
=====================
![Fibonacci plant screenshot](https://raw.github.com/oluckyman/fibonacci-plant/master/screen_shot.png)

В этой модели демонстрируется как растущие листья образуют между собой Золотой Угол (~137.508°).  
Модель выполнена на Processing'e.

## Филлотаксис
**Филлотаксис** -- это термин означающий расположение листьев на стебле растения.  
Винтовой филлотаксис можно наблюдать на цветках подсолнуха, на шишках, на ананасах и на множестве других растений.

## Филлотаксис и последовательность Фибоначчи
При винтовом расположении лепестков или семечек в их узоре можно обнаружить спирали (parastichies). Чаще всего количество этих спиралей является числом из последовательности Фибоначчи (1, 1, 2, 3, 5, 8, 13, 21 ...). А угол между соседними лепестками близок к Золотому Углу - около 137.508°. Такой тип узоров встречается довольно часто и называется **Fibonacci phyllotaxis**.

## Почему Fibonacci phyllotaxis так распространён?
Природа ничего не знает о Фибоначчи, математике и углах. Зато она знает о том, что чем больше листья получают света и дождя, тем лучше. Значит должен быть какой-то простой принцип, подчиняясь которому, растения получают максимальное количество света и при этом образуют Золотой Угол между своими листьями.

## Об этой модели
Моей целью было обнаружить как Fibonacci phyllotaxis проявляется сам при симуляции роста растения.  
Создавая эту модель вместо явного указания золотого угла между новыми листьями, я задал следующие принципы:
 - С заданной периодичностью в центре стебля (с небольшой погрешностью) появляется новый лист;
 - Как только лист появился, он начинает двигаться из центра под заданным углом;
 - Следующий лист выбирает направление роста таким, чтоб быть максимально далеко от уже существующих.
 
Запустив эту модель можно убедиться, что угол между соседними листьями близок к Золотому Углу.

### Запуск
Для работы требуется [Processing 2.0](http://processing.org) или выше.  
В окне приложения нажмите кнопку `open` и выберете файл `fibonacci_plant\fibonacci_plant.pde`.  
Нажмите `run`.  

### UI
В центре кружком синего цвета обозначен стебель.  
Новый лист появляется, когда предыдущий выходит за пределы стебля.  
Жёлтой точкой на стебле помечается направление роста следующего листа.  
Слева красным цветом ведётся список углов между листьями. В скобках указано процентное соотношение с Золотым Углом.  
Через некоторое время начинают появляться спирали (parastichies). 5 жёлтых и 8 голубых.

### Управление
*левая кнопка мыши* - нажмите и держите, чтоб включить паузу; нажмите и тащите, чтоб  перемещаться.
*правая кнопка мыши* - нажмите, чтоб масштабировать (сверху экрана для увеличения, снизу экрана для уменьшения).

#!/usr/bin/perl

use warnings;
use strict;

open(STDOUT, '>index.html.new');

my %fields = (
	refresh => 'Время обновления',
	coverage => 'Покрытие',
	author => 'Автор',
	authors => 'Авторы',
);

# TODO: get these from GeoIP and/or from user selection
my $lat="55.742";
my $lon="37.658";
my $zoom="11";

my $objects = [
	{
		caption => 'Официальные рендеры',
		items => [
			{
				name => 'Mapnik',
				url => 'http://www.openstreetmap.org/?lat=LAT&lon=LON&zoom=ZOOM&layers=M',
				image => 'mapnik.png',,
				descr => 'Основной рендер OpenStreetMap. При этом самый быстрый - задержка между внесением изменений в карту и отрисовкой обычно не превышает нескольких минут.',
				refresh => 'Минуты',
				coverage => 'Вся планета',
			},
			{
				name => 'Cycle Map',
				url => 'http://www.openstreetmap.org/?lat=LAT&lon=LON&zoom=ZOOM&layers=C',
				image => 'cyclemap.png',
				descr => 'Карта для велосипедистов с топографией и выделением веломаршрутов.',
				refresh => 'Несколько дней',
				coverage => 'Вся планета',
			},
			{
				name => 'Transport Map',
				url => 'http://www.openstreetmap.org/?lat=LAT&lon=LON&zoom=ZOOM&layers=T',
				image => 'transport_map.png',
				descr => 'Слой с маршрутами общественного транспорта.',
				refresh => 'Несколько дней',
				coverage => 'Вся планета',
			},
			{
				name => 'MapQuest Open',
				url => 'http://www.openstreetmap.org/?lat=LAT&lon=LON&zoom=ZOOM&layers=Q',
				image => 'mapquest.png',
				descr => 'Альтернативный слой от <a href="mapquest.com">mapquest.com</a>',
				refresh => 'Несколько дней',
				coverage => 'Вся планета',
			},
		],
	},

	{
		caption => 'Сторонние рендеры',
		items => [
			{
				name => 'MapSurfer.NET/Road',
				url => 'http://www.openmapsurfer.uni-hd.de/?layers=B0000&zoom=ZOOM&lat=LAT&lon=LON',
				image => 'mapsurfer.png',
				descr => 'Сторонний рендер с псевдотрехмерными зданиями, написанный на C#.',
				refresh => 'Регулярно (но низкие зумы редко)',
				authors => 'Maxim Rylov and Vitaly Chezganov',
				coverage => 'Вся планета',
			},
			{
				name => 'Чепецк.net',
				url => 'http://чепецк.net/?lat=LAT&lon=LON&zoom=ZOOM',
				image => 'chepetsk.png',
				descr => 'Рендер с подробным туристическим стилем.',
				author => '<a href="http://www.openstreetmap.org/user/Max%20Vasilev">Max Vasilev</a>',
				refresh => 'Ежедневно',
				coverage => 'Страны СНГ',
			},
#			{
#				name => 'MapSurfer.NET/Topographic',
#				url => 'http://www.mapsurfer.net/?layers=0BT&zoom=ZOOM&lat=LAT&lon=LON',
#				image => 'mapsurfer_topo.png',
#				descr => 'Сторонний рендер с псевдотрехмерными зданиями, написанный на C#, топографический слой.',
#				refresh => 'Давно не обновлялся',
#				authors => 'Maxim Rylov and Vitaly Chezganov',
#				coverage => 'Вся планета',
#			},
#			{
#				name => 'MapSurfer.NET/Hybrid',
#				url => 'http://www.openstreetmap.ru/#layer=BY&zoom=ZOOM&lat=LAT&lon=LON',
#				image => 'mapsurfer_hybrid.png',
#				descr => 'Полупрозрачный слой с подписями для использования поверх спутниковых снимков и карт',
#				authors => 'Maxim Rylov and Vitaly Chezganov',
#				coverage => 'Вся планета',
#			},
			{
				name => 'OpenStreetMap.by',
				url => 'http://openstreetmap.by/?lat=LAT&lon=LON&zoom=ZOOM',
				image => 'osmby.png',
				descr => 'Рендер с продвинутым стилем.',
				author => '<a href="http://www.openstreetmap.org/user/Kom%D1%8Fpa">Komяpa</a>',
				refresh => 'Минуты',
				coverage => 'Вся планета',
			},
			{
				name => 'LatLon.org/Buildings',
				url => 'http://latlon.org/buildings?zoom=ZOOM&lat=LAT&lon=LON&layers=BFT',
				image => 'latlon_buildings.png',
				descr => 'Рендер слоя с псевдотрехмерными зданиями.',
				refresh => 'Реальное время',
				author => '<a href="http://www.openstreetmap.org/user/Kom%D1%8Fpa">Komяpa</a>',
				coverage => 'СНГ',
			},
			{
				name => '&Ouml;PNV-Karte',
				url => 'http://www.xn--pnvkarte-m4a.de/?zoom=ZOOM&lat=LAT&lon=LON',
				image => 'opnvkarte.png',
				descr => 'Сторонний рендер с маршрутами общественного транспорта.',
				refresh => 'Раз в несколько дней',
				coverage => 'Европа (до 45° в.д.)',
			},
			{
				name => 'openptmap',
				url => 'http://openptmap.org/?zoom=ZOOM&lat=LAT&lon=LON&layers=B0000TFT',
				image => 'openptmap.png',
				descr => 'Сторонний рендер с маршрутами общественного транспорта.',
				refresh => 'Раз в день',
				coverage => 'Вся планета',
			},
			{
				name => 'OpenStreetBrowser',
				url => 'http://www.openstreetbrowser.org/?zoom=ZOOM&lat=LAT&lon=LON',
				image => 'openstreetbrowser.png',
				descr => 'Карта с большим количеством накладываемых слоёв с различной информацией (общественный транспорт, заправки, питание, туризм и т.д.).',
				coverage => 'Европа (до 45° в.д.)',
			},
			{
				name => 'Hike & Bike Map',
				url => 'http://hikebikemap.de/?zoom=ZOOM&lat=LAT&lon=LON',
				image => 'hikebike.png',
				descr => 'Карта для пешеходов и велосипедистов. Поддерживает визуализацию рельефа и ночного освещения.',
			},
			{
				name => 'CloudMade Maps',
				url => 'http://maps.cloudmade.com/?zoom=ZOOM&lat=LAT&lng=LON',
				image => 'cloudmade.png',
				descr => 'Карта с большим количеством разнообразных стилей отрисовки на выбор, с возможностью создания своих стилей.',
				authors => '<a href="http://cloudmade.com/">CloudMade</a>',
				refresh => 'Несколько дней',
			},
			{
				name => 'LatLon.org/Public transport',
				url => 'http://latlon.org/pt/?zoom=ZOOM&lat=LAT&lon=LON',
				image => 'latlon_pt.png',
				descr => 'Рендер маршрутов общественного транспорта.',
				author => '<a href="http://www.openstreetmap.org/user/Kom%D1%8Fpa">Komяpa</a>',
			},
			{
				name => 'glosm',
				url => 'http://glosm.amdmi3.ru/?zoom=ZOOM&lat=LAT&lon=LON&layers=B0',
				image => 'glosm.png',
				descr => 'OpenGL рендер, поддерживающий помимо генерации тайлов вид от первого лица в реальном времени.',
				author => '<a href="http://www.openstreetmap.org/user/AMDmi3">AMDmi3</a>',
				coverage => 'Москва',
				refresh => 'Нерегулярно',
			},
		],
	},

	{
		caption => 'Прокладка маршрутов',
		items => [
			{
				name => 'OSRM',
				url => 'http://map.project-osrm.org/?z=ZOOM&center=LAT,LON',
				image => 'osrm.png',
				descr => 'Быстрая прокладка маршрутов по карте OSM.',
				coverage => 'Вся планета',
				refresh => 'Приблизительно раз в неделю (актуальность данных можно посмотреть нажав на кнопку с шестерёнкой)',
			},
			{
				name => 'YourNavigation',
				url => 'http://www.yournavigation.org/',
				image => 'routing.png',
				descr => 'Прокладка маршрутов по карте OSM.',
				coverage => 'Вся планета',
			},
			{
				name => 'OpenRouteService.org',
				url => 'http://openrouteservice.org/?zoom=ZOOM&lat=LAT&lon=LON',
				image => 'openrouteservice.png',
				descr => 'Прокладка маршрутов по карте OSM.',
				coverage => 'Вся планета',
			},
		],
	},

	{
		caption => 'Мэшапы и рендеринг сторонней информации на основе OSM',
		items => [
			{
				name => 'Social Networks in OpenLayers',
				url => 'http://social.osm4people.org/?zoom=ZOOM&lat=LAT&lon=LON&layers=0B00000FF0TFFFFFTT',
				image => 'social.png',
				descr => 'Различные социальные сервисы (<a href="http://panoramio.com">Panoramio</a>, <a href="http://flickr.com">Flickr</a>, <a href="http://last.fm">Last.fm</a>, <a href="http://twitter.com">Twitter</a> и другие) на карте OSM.',
			},
			{
				name => 'OpenSeaMap/Weather',
				url => 'http://map.openseamap.org/map/weather.php?zoom=ZOOM&lat=LAT.65945&lon=LON',
				image => 'openseamap_weather.png',
				descr => 'Погодная карта',
			},
			{
				name => 'OpenWeatherMap',
				url => 'http://openweathermap.org/?zoom=ZOOM&lat=LAT&lon=LON', # XXX: lat/lon is not in degrees! (7526976.40009, 4273570.40519)
				image => 'openweathermap.png',
				descr => 'Погодная карта',
			},
		],
	},

	{
		caption => 'Инструменты контроля качества',
		items => [
			{
				name => 'OpenStreetBugs',
				url => 'http://osmbugs.org/?lat=LAT&lon=LON&zoom=ZOOM',
				image => 'openstreetbugs.png',
				descr => 'Простой в использовании сервис, где любой желающий может оставить сообщение о ошибке или неточности на карте, а любой пользователь OpenStreetMap может помочь исправить эти ошибки.',
				coverage => 'Вся планета',
				refresh => 'В реальном времени',
			},
			{
				name => 'KeepRight!',
				url => 'http://keepright.ipax.at/report_map.php?zoom=ZOOM&lat=LAT&lon=LON',
				image => 'keepright.png',
				descr => 'Инструмент, помогающий выявить огромное количество топологических ошибок на карте, включая неправильно отмеченные объекты, отсутствие необходимых тэгов, несоединённые и самопересекающиеся дороги и т.д.',
				coverage => 'Вся планета',
				refresh => 'Примерно раз в неделю',
			},
			{
				name => 'WHO DID IT?!',
				url => 'http://zverik.osm.rambler.ru/whodidit/?zoom=ZOOM&lat=LAT&lon=LON',
				image => 'whodidit.png',
				descr => 'Мониторинг правок пользователей на выбранной территории.',
				coverage => 'Вся планета',
				refresh => 'Ежечасно',
			},
			{
				name => 'Geofabrik Tools/OSM Inspector', # TODO: нужно разбить на инструменты; для разных инструментов разный coverage
				url => 'http://tools.geofabrik.de/osmi/?view=addresses&zoom=ZOOM&lat=LAT&lon=LON',
				image => 'osminspector.png',
				descr => 'Набор инструментов для визуализации различных объектов и их отношений на карте. Включает инструменты, показывающие ошибки геометрии и тэгов, а также подробную визуализацию населённых пунктов, дорожной сети, адресации, границ, водоёмов, общественного транспорта.',
				coverage => 'Европа (до 45° в.д.)',
				refresh => 'Несколько дней',
				authors => '<a href="http://www.geofabrik.de/">Geofabrik GmbH</a>',
			},
			{
				name => 'Turn Restrictions',
				url => 'http://map.comlu.com/?zoom=ZOOM&lat=LAT&lon=LON',
				image => 'turn_restrictions.png',
				descr => 'Инструмент для визуализации и выявления ошибок в ограничениях поворотов.',
				author => '<a href="http://www.openstreetmap.org/user/Zartbitter">Zartbitter</a>',
				coverage => 'Вся планета',
			},
#			{
#				name => 'LatLon.org/Lonely',
#				url => 'http://latlon.org/v/lonely?zoom=ZOOM&lat=LAT&lon=LON&layers=BT',
#				image => 'latlon_lonely.png',
#				descr => 'Рендер населенных пунктов, к которым не отмечено подъездных дорог.',
#				author => '<a href="http://www.openstreetmap.org/user/Kom%D1%8Fpa">Komяpa</a>',
#				coverage => 'Вся планета',
#			},
#			{
#				name => 'Duplicate Nodes',
#				url => 'http://matt.dev.openstreetmap.org/dupe_nodes/?zoom=ZOOM&lat=LAT&lon=LON',
#				image => 'dupenodes.png',
#				descr => 'Простой инструмент, показывающий дублированные точки.',
#				refresh => 'Практически в реальном времени',
#				coverage => 'Вся планета',
#			},
#			{
#				name => 'YAV/Водные объекты',
#				url => 'http://yav.gis-lab.info/rsa/map?zoom=ZOOM&lat=LAT&lon=LON',
#				image => 'yav_water.png',
#				descr => 'Валидатор водных объектов. Позволяет находить такие ошибки как незаконченные реки (которые никуда не впадают) и неправильное направление рек.',
#				author => '<a href="http://www.openstreetmap.org/user/Aleksandr%20Dezhin">Aleksandr Dezhin</a>',
#				coverage => 'Россия',
#			},
#			{ # Dezhin: Да пока я ту штуку которая была с картой отключил, все равно все пользуются текстовым вариантом.
#				name => 'YAV/ОКАТО',
#				url => 'http://dezhin.gis-lab.info/yav/?layers=BTFFFFFF&zoom=ZOOM&lat=LAT&lon=LON',
#				image => 'yav_okato.png',
#				descr => 'Валидатор населённых пунктов.',
#				author => '<a href="http://www.openstreetmap.org/user/Aleksandr%20Dezhin">Aleksandr Dezhin</a>',
#				coverage => 'Россия',
#			},
#			{
#				name => 'YAV/Ошибки границ',
#				url => 'http://yav.gis-lab.info/boundaries/map?zoom=ZOOM&lat=LAT&lon=LON',
#				image => 'yav_boundary.png',
#				descr => 'Валидатор границ.',
#				author => '<a href="http://www.openstreetmap.org/user/Aleksandr%20Dezhin">Aleksandr Dezhin</a>',
#				coverage => 'Россия',
#			},
		],
	},

	{
		caption => 'Рендеры специфичной информации',
		items => [
			{
				name => 'ITO OSM Mapper',
				url => 'http://www.itoworld.com/product/osm/',
				image => 'ito.png',
				descr => 'Сервис, позволяющий просматривать различную информацию по карте: время последнего редактирования объектов, правки пользователей, наличие определенных тэгов и т.д..<br>Сервис бесплатный, но требуется <a href="http://www.itoworld.com/static/product_register?product=OSM">регистрация</a>.<br>Есть возможность экспорта изображений.',
				coverage => 'Вся планета (но нужно будет выбрать конкретные регионы для мониторинга)',
				refresh => 'Несколько дней',
				authors => '<a href="http://www.itoworld.com/">ITO</a>',
			},
			{
				name => 'ITO Map',
				url => 'http://www.itoworld.com/product/data/ito_map/main',
				image => 'itomap.png',
				descr => 'Большое количество оверлеев, как выделяющих отдельные категории объектов (препятствия, электрическая сеть, железные дороги, водные объекты, тротуары и т.д.), так и демонстрирующих дополнительные подробности (поверхность, освещённость или полосность дорог, ограничения скорости, высотность зданий, значение layer= и т.д.)',
				coverage => 'Вся планета',
				authors => '<a href="http://www.itoworld.com/">ITO</a>',
			},
#			{
#				name => 'Restriction Analyzer',
#				url => 'http://osm.virtuelle-loipe.de/restrictions/?zoom=ZOOM&lat=LAT&lon=LON',
#				image => 'restrictions.png',
#			},
#			{
#				name => 'Toolserver/lighting',
#				url => 'http://toolserver.org/~osm/styles/?zoom=ZOOM&lat=LAT&lon=LON&layers=B000F0TF0000F0FF00',
#				image => 'lit.png',
#				descr => 'Визуализация ночного освещения (тэг lit=*).',
#				refresh => 'От нескольких часов (13-14 zoom) до нескольких дней',
#			},
			{
				name => 'Toolserver/locales',
				url => 'http://toolserver.org/~osm/locale/?zoom=ZOOM&lat=LAT&lon=LON',
				image => 'locale.png',
				descr => 'Набор mapnik-слоёв с подписями на разных языках.',
			},
			{
				name => 'Toolserver/hillshading',
				url => 'http://toolserver.org/~osm/styles/?zoom=ZOOM&lat=LAT&lon=LON&layers=B000F0FT0000F0FF00',
				image => 'hillshading.png',
				descr => 'Карта с наложением рельефа.',
			},
#			{
#				name => 'Nav Debug',
#				url => 'http://cartography.sandbox.cloudmade.com/navdebug/?zoom=ZOOM&lat=LAT&lng=LON',
#				image => 'navdebug.png',
#			},
			{
				name => 'lowzoom',
				url => 'http://lowzoom.osm.rambler.ru/',
				image => 'lowzoom.png',
				descr => 'Обзорная карта, сгенерированная из тайлов Mapnik 9 зума при помощи <a href="http://wiki.openstreetmap.org/wiki/Tiletool">TileTool</a>.',
				coverage => 'Вся планета',
				author => '<a href="http://www.openstreetmap.org/user/AMDmi3">AMDmi3</a>',
				refresh => 'Нерегулярно',
			},
		],
	},

	{
		caption => 'Информация по участникам OSM',
		items => [
			{
				name => 'OSM Heat Map',
				url => 'http://yosmhm.neis-one.org/',
				image => 'heatmap.png',
				descr => '"Тепловая карта" правок пользователя',
				coverage => 'Вся планета',
				author => 'Pascal Neis',
			},
			{
				name => 'OoOC',
				url => 'http://resultmaps.neis-one.org/oooc?zoom=ZOOM&lat=LAT&lon=LON',
				image => 'oooc.png',
				descr => 'Карта, отображающая примерное положение и количество правок участников OSM',
				coverage => 'Вся планета',
				author => 'Pascal Neis',
			},
			{
				name => 'OSM Live',
				url => 'http://datenkueche.com/osmlive/',
				image => 'osmlive.png',
				descr => 'Мониторинг правок по всей планете в реальном времени',
			},
		],
	},

	{
		caption => 'Сравнение карт',
		items => [
			{
				name => 'Geofabrik Tools/Map Compare',
				url => 'http://tools.geofabrik.de/mc/?zoom=ZOOM&lat=LAT&lon=LON',
				image => 'mapcompare.png',
				descr => 'Сервис для side-by-side сравнения карт. Кроме OSM поддерживает карты Google.',
				authors => '<a href="http://www.geofabrik.de/">Geofabrik GmbH</a>',
			},
			{
				name => 'Transparent map compare',
				url => 'http://sautter.com/map/?zoom=ZOOM&lat=LAT&lon=LON',
				image => 'transparent.png',
				descr => 'Сервис, позволяющий сравнить две карты, наложив одну на другую с регулируемой прозрачностью. Кроме OSM поддерживает карты Google и Yahoo.',
			},
#			{
#				name => '45F.RU',
#				url => 'http://45f.ru/v/atlogis/duo/?zoom=ZOOM&lat=LAT&lon=LON&layers=0000000000000B0FF',
#				descr => 'Сервис для side-by-side сравнения карт. Кроме OSM поддерживает карты Google, Yahoo, Bing, Atlogis.',
#				authors => '<a href="http://45f.ru">45f.ru</a>',
#			},
		],
	},

	# TODO: добавить, как минимум: latlon, openorientingmap
	#
	# TODO: добавить все текстовые ресурсы (водный реестр, валидатор адресов от Лёши и т.д.)
	# TODO: добавить альтернативные проекты и карты (нужно?)
];

print "<html><head><title>OSM::Portal: всё это - OpenStreetMap</title>";
print "<meta http-equiv=\"Content-type\" value=\"text/html; charset=utf-8\">";
print "<link rel=\"stylesheet\" media=\"screen\" href=\"osm-portal.css\">";
print "</head>";
print "<body>";

print "<div id=\"switcher\">";

my $num = 0;
foreach my $page (@$objects) {
	print "<input type=\"radio\" name=\"selector\" id=\"radio$num\"";
	print " checked=\"checked\"" if ($num == 0);
	print "/><label for=\"radio$num\">$page->{caption}</label>";
	$num++;
}

print "</div>";

$num = 0;
foreach my $page (@$objects) {
	print "<div class=\"page\"><h1>$page->{caption}</h1>";

	foreach my $item (@{$page->{items}}) {
		my $has_data = 0;
		my $url = $item->{url};
		$url =~ s/LAT/$lat/; $url =~ s/LON/$lon/; $url =~ s/ZOOM/$zoom/;
		print "<div class=\"block\"><a href=\"$url\"><h2>$item->{name}</h2></a>";

		foreach my $field (keys %fields) {
			if (defined $item->{$field}) {
				$has_data = 1;
				last;
			}
		}

		if ($has_data || defined $item->{descr}) {
			print "<div class=\"descr\">";
			if (defined $item->{descr}) {
				print "<p>$item->{descr}</p>\n";
			}

			if ($has_data) {
				print "<ul>";
				foreach my $field (keys %fields) {
					next unless defined $item->{$field};

					print "<li><b>$fields{$field}:</b> $item->{$field}</li>";
				}
				print "</ul>";
			}
			print "</div>";
		}
		print "<a href=\"$url\"><img src=\"$item->{image}\"></a>";
		print "</div>";
	}

	print "</div>";
}

print "<script src=\"osm-portal.js\" type=\"text/javascript\"></script>";
print "</body></html>";

close(STDOUT);

rename("index.html.new", "index.html");

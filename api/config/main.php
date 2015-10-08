<?php
 
$params = array_merge(
    require(__DIR__ . '/../../common/config/params.php'),
    require(__DIR__ . '/../../common/config/params-local.php'),
    require(__DIR__ . '/params.php')
    //require(__DIR__ . '/params-local.php')
);
return [
    'id' => 'app-api',
    'basePath' => dirname(__DIR__),
    'bootstrap' => ['log'],
    'modules' => [
        'v1' => [
            'basePath' => '@app/modules/v1',
            'class' => 'api\modules\v1\Module'   // here is our v1 modules
        ]
    ],
	
    'components' => [
        'user' => [
            'identityClass' => 'common\models\User',
            'enableAutoLogin' => false,
        ],
        'log' => [
            'traceLevel' => YII_DEBUG ? 3 : 0,
            'targets' => [
                [
                    'class' => 'yii\log\FileTarget',
                    'levels' => ['error', 'warning'],
                    'logFile' => 'salamiapp.log',
                ],
				[
					'class' => 'yii\log\FileTarget',
					'levels' => ['info'],
					'categories' => ['test_category'],
					'logFile' => 'test_success.log',
				]
            ],
        ],
		
		'request' => [
            'parsers' => [
                'application/json' => 'yii\web\JsonParser',
            ]
        ],
        'urlManager' => [
            'enablePrettyUrl' => true,
            'enableStrictParsing' => true,
            'showScriptName' => false,
            'rules' => [
                [
                    'class' => 'yii\rest\UrlRule',
                    'controller' => 'v1/user'
                ],
                [
                    'class' => 'yii\rest\UrlRule',
                    'controller' => 'v1/salamiuser',
                    'extraPatterns' => ['GET search' => 'search']

                ],
                [
                    'class' => 'yii\rest\UrlRule',
                    'controller' => 'v1/album',
                    'extraPatterns' => ['GET search' => 'search']
                ],
                [
                    'class' => 'yii\rest\UrlRule',
                    'controller' => 'v1/photos',
                    'extraPatterns' => ['GET search' => 'search']
                ]
            ],
        ]
    ],
    'params' => $params,
];
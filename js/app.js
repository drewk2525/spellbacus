(function() {
    angular.module('myApp', []).controller('appController', function($scope,$sce,$http) {
        $scope.char_name = "";
        $scope.char_level = "";
        var site = document.URL;
        site = site.substring(0, site.lastIndexOf('/')+1);
        var page = "/mysql/get_classes.php";
        $http.get(site + page)
        .success(function(response) {$scope.classes = response;})
        .error(function(data,status,headers,config){
            error.log('error');
            error.log(data);
            error.log(status);
            error.log(headers);
            error.log(config);
        });


        $scope.show_ability_mod = function(mod) {
            if(mod == null || isNaN(mod)) {return false;}
            else {return true;}
        }

        $scope.spell_html_display = function(spell){
            return $sce.trustAsHtml(spell);
        }


        $scope.calc_spells_per_day = function(char_class, char_level, ability_score, class_switch) {
            if (class_switch === true){
                $scope.spells_known = [{"id": "0",
                    "char_level": "0",
                    "0_spells": "0",
                    "1_spells": "0",
                    "2_spells": "0",
                    "3_spells": "0",
                    "4_spells": "0",
                    "5_spells": "0",
                    "6_spells": "0",
                    "7_spells": "0",
                    "8_spells": "0",
                    "9_spells": "0",
                    }];
            } else {
                for (x=0; x<10; x++){
                    window["spell_list"+x] = document.getElementsByClassName('spell_list'+x);
                    if (window["spell_list"+x] === undefined)
                        window["spell_list"+x] = [];
                    window["saved_spell_list"+x] = [];
                    for (i=0; i < window["spell_list"+x].length; i++){
                        window["saved_spell_list"+x][i] = window["spell_list"+x][i].value;
                    }
                }
            }

            var spells_per_day = char_class.spells_per_day;
            var spells_known = char_class.spells_known;
            if(spells_per_day && char_level){
                page = "/mysql/get_spells_per_day.php?spells="+
                spells_per_day+"&level="+char_level;
                $http.get(site + page)
                .success(function(response) {$scope.spells_per_day = response;})
                .error(function(data,status,headers,config){
                    error.log('error');
                    error.log(data);
                    error.log(status);
                    error.log(headers);
                    error.log(config);
                });

                page = "/mysql/get_spells_per_day.php?spells="+
                spells_known+"&level="+char_level;
                $http.get(site + page)
                .success(function(response) {$scope.spells_known = response;});
            }



            if(char_class.class_name && char_level){
                $scope.spells = [];
                page = "/mysql/get_spells.php?level=0&class="+char_class.class_name;
                $http.get(site + page)
                .success(function(response) {$scope.spells[0] = response;});

                page = "/mysql/get_spells.php?level=1&class="+char_class.class_name;
                $http.get(site + page)
                .success(function(response) {$scope.spells[1] = response;});

                page = "/mysql/get_spells.php?level=2&class="+char_class.class_name;
                $http.get(site + page)
                .success(function(response) {$scope.spells[2] = response;});

                page = "/mysql/get_spells.php?level=3&class="+char_class.class_name;
                $http.get(site + page)
                .success(function(response) {$scope.spells[3] = response;});

                page = "/mysql/get_spells.php?level=4&class="+char_class.class_name;
                $http.get(site + page)
                .success(function(response) {$scope.spells[4] = response;});

                page = "/mysql/get_spells.php?level=5&class="+char_class.class_name;
                $http.get(site + page)
                .success(function(response) {$scope.spells[5] = response;});

                page = "/mysql/get_spells.php?level=6&class="+char_class.class_name;
                $http.get(site + page)
                .success(function(response) {$scope.spells[6] = response;});

                page = "/mysql/get_spells.php?level=7&class="+char_class.class_name;
                $http.get(site + page)
                .success(function(response) {$scope.spells[7] = response;});

                page = "/mysql/get_spells.php?level=8&class="+char_class.class_name;
                $http.get(site + page)
                .success(function(response) {$scope.spells[8] = response;});

                page = "/mysql/get_spells.php?level=9&class="+char_class.class_name;
                $http.get(site + page)
                .success(function(response) {$scope.spells[9] = response;});
            }

            $scope.ability_mod = Math.floor(ability_score/2);
            $scope.ability_mod -= 5;
            page = "/mysql/get_spells_per_day.php?spells=0&level="+$scope.ability_mod;
            $http.get(site + page)
            .success(function(response) {$scope.ability_mod_bonus = response;});
            var str = '';
            $scope.spell_dc = [];
            for (i = 0; i < 10; i++) {
                str = i+'_spells';
                $scope.spell_dc[str] = 10 + $scope.ability_mod + i;
            }
            if (class_switch !== true){
                setTimeout(function(){
                    for(x=0; x<10; x++){
                        for (i=0; i < window["spell_list"+x].length; i++){
                            for(j=0; j < window["spell_list"+x][i].options.length; j++)
                                {
                                  if(window["spell_list"+x][i].options[j].value == window["saved_spell_list"+x][i])
                                    window["spell_list"+x][i].selectedIndex = j;
                                }
                        }
                    }
                }, 200);
            }
        }

        $scope.addition = function(a,b){
            if (a == '-') { return '-';}
            a = parseInt(a, 10);
            b = parseInt(b, 10);
            if(isNaN(a+b) && isNaN(a)) {return '';}
            if(isNaN(a+b)) {return a;} else return a+b;
        }

        $scope.getNumber = function(num) {
            return new Array(num);
        }


        $scope.get_spell_values = function(){
            page = "/mysql/get_spells_per_day.php?spells="+
            spells_per_day+"&level="+char_level;
            $http.get(site + page)
            .success(function(response) {$scope.spells_per_day = response;})
        }

    });
}());
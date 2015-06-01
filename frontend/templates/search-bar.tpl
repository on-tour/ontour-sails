<menu id="search"
      ng-class="{'slide-menu' : pages.page}"
      class="fade-animation">
    <section>
        <nav ng-repeat="tab in tabTitles"
             ng-click="switchTab(tab)"
             ng-class="{'active' : menu.activeTab.title === tab.title}"
             ng-bind="tab.name"
             ng-cloak
             class="tab">
        </nav>
    </section>

    <section ng-controller="AutocompleteController">
        <form name="menuForm">
            <input ng-class="{'invalid' : menuForm.searchValue.$invalid}"
                   ng-model="menu.searchValue"
                   ng-keydown="getAutocompleteData(menu.searchValue)"
                   ng-cloak
                   class="search-field"
                   name="searchValue"
                   placeholder="Введите {{menu.activeTab.title}}">
        </form>
        
        <section class="autocomplete">
            <div ng-repeat="item in autocomplete.items"
                 ng-click="search(item.name)"
                 ng-mouseover="selectItem(item)"
                 ng-class="{'hover' : autocomplete.activeItem === item}"
                 ng-cloak>
                 <a>{{item.name}} {{item.meta}}</a>
            </div>
        </section>

    <section class="tags"
             ng-if="menu.activeTab.name === 'Город'"
             class="fade-animation">
        <div ng-repeat="tag in tags"
             ng-click="switchTag(tag)"
             ng-class="{'active' : menu.activeTag === tag}"
             ng-bind="tag"
             ng-cloak
             class="tag">
        </div>
    </section>
    
    <a class="search-button" ng-click="search(menu.searchValue)">Поиск</a>

    <a ng-click="setFestivalsOnly()"
       ng-class="{'active' : menu.festivalsOnly === 1}"
       title="Только фестивали"
       class="festivals"> Ф </a>

</menu>
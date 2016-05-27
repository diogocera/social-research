(function() {
  var ResearchUnitStore;

  ResearchUnitStore = (function() {
    ResearchUnitStore.displayName = 'ResearchUnitStore';

    function ResearchUnitStore() {
      this.bindActions(ResearchUnitActions);
      this.research_units = [];
      this.exportPublicMethods({
        getResearchUnits: this.getResearchUnits
      });
    }

    ResearchUnitStore.prototype.onInitData = function(props) {
      return this.research_units = props.research_units;
    };

    ResearchUnitStore.prototype.getResearchUnits = function() {
      return this.getState().research_units;
    };

    ResearchUnitStore.prototype.onSubmitResearchUnit = function(name) {
      $.ajax({
        type: 'POST',
        url: '/research_units',
        data: {
          research_unit: {
            name: name,
            checked: false
          }
        },
        success: (function(_this) {
          return function(response) {
            _this.research_units.push(response);
            return _this.emitChange();
          };
        })(this),
        error: (function(_this) {
          return function(response) {
            console.log('error');
            return console.log(response);
          };
        })(this)
      });
    };

    return ResearchUnitStore;

  })();

  window.ResearchUnitStore = alt.createStore(ResearchUnitStore);

}).call(this);
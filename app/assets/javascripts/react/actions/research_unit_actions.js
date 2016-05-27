(function() {
  var ResearchUnitActions;

  ResearchUnitActions = (function() {
    function ResearchUnitActions() {
      this.generateActions('initData', 'submitResearchUnit');
    }

    return ResearchUnitActions;

  })();

  window.ResearchUnitActions = alt.createActions(ResearchUnitActions);

}).call(this);
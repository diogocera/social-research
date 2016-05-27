(function() {
  var ResearchUnitForm, ResearchUnitList, ResearchUnitListItem, a, div, h1, input, label, li, ref, span, ul;

  ref = React.DOM, div = ref.div, h1 = ref.h1, ul = ref.ul, li = ref.li, a = ref.a, span = ref.span, label = ref.label, input = ref.input;

  ResearchUnitForm = React.createFactory(React.createClass({
    getInitialState: function() {
      return {
        researchUnitName: ''
      };
    },
    onInputChange: function(e) {
      return this.setState({
        researchUnitName: e.target.value
      });
    },
    onInputKeyDown: function(e) {
      if (e.keyCode === 13 && this.refs.researchUnit.value.length) {
        ResearchUnitActions.submitResearchUnit(this.refs.researchUnit.value);
        return this.setState({
          researchUnitName: ''
        });
      }
    },
    render: function() {
      return div({
        className: 'form-group'
      }, label({}, 'Enter ResearchUnit'), input({
        onChange: this.onInputChange,
        onKeyDown: this.onInputKeyDown,
        ref: 'researchUnit',
        className: 'form-control',
        placeholder: 'Enter researchUnit name',
        value: this.state.researchUnitName
      }));
    }
  }));

  ResearchUnitListItem = React.createFactory(React.createClass({
    render: function() {
      return li({
        className: 'list-item'
      }, a({
        className: 'btn btn-primary'
      }, 'Check'), span({
        className: 'list-text'
      }, this.props.research_unit.name));
    }
  }));

  ResearchUnitList = React.createFactory(React.createClass({
    render: function() {
      return ul({
        className: 'list-unstyled'
      }, _.map(this.props.research_units, (function(_this) {
        return function(research_unit) {
          return ResearchUnitListItem({
            research_unit: research_unit
          });
        };
      })(this)));
    }
  }));

  window.ResearchUnitIndex = React.createClass({
    getInitialState: function() {
      return {
        research_units: []
      };
    },
    componentWillMount: function() {
      ResearchUnitStore.listen(this.onChange);
      return ResearchUnitActions.initData(this.props);
    },
    componentWillUnmount: function() {
      return ResearchUnitStore.unlisten(this.onChange);
    },
    onChange: function(state) {
      return this.setState(state);
    },
    render: function() {
      return div({
        className: 'container'
      }, div({
        className: 'row'
      }, div({
        className: 'col-xs-12'
      }, h1({}, 'ResearchUnit List'), ResearchUnitForm(), ResearchUnitList({
        research_units: this.state.research_units
      }))));
    }
  });

}).call(this);
import React from "react"
import PropTypes from "prop-types"

const Helloworld = (props) => {
  return (
    <React.Fragment>
      Greeting: {props.greeting}
    </React.Fragment>
  )
}

Helloworld.propTypes = {
  greeting: PropTypes.string
};

export default Helloworld

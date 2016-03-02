{request, _, gl_mat, r_aj, React, React_DOM, rr, c, shortid, assign, keys, mat3, vec3, vec2} = require('./boilerplate.coffee')()

{p, div, h1, h2, h3, h4, h5, h6, span, svg, circle, rect, ul, line, li, ol, code, a, input, defs, clipPath, linearGradient, stop, g, path, d, polygon, image, pattern, filter, feBlend, feOffset, polyline, feGaussianBlur, feMergeNode, feMerge, radialGradient, foreignObject, text, ellipse} = React.DOM

c 'image', image

mock = require '../mock/mock_000.coffee'
module.exports = widget = rr

    componentDidMount: ->
        # c 'hi'
        obj = JSON.parse mock
        c 'obj', obj

        # request
        # .get "
        # http://api.erated.co/v1/users/bf2ec2098ca8bc146be3eb3fcaab5b53b69075cf"
        # .query {partner: '12341234'}
        # .query {mode: 'marketplaces'}
        # .end (err, res)=>
        #     data = JSON.parse(res.text).data
        #     # c 'data', data
        #     c 'data.relevant_reputation', data.relevant_reputation

            # @setState
            #     data: data
            #     relevant_reputation: data.relevant_reputation

    componentWillReceiveProps: (next_props)->
        @setState
            M: next_props.M

    getInitialState: ->
        M: @props.M

    rect_t: (subj_rect)->
        {width, height, x, y} = subj_rect
        origin: vec2.transformMat3 vec2.create(), [x, y], @state.M
        width: width * @state.M[0]
        height: -(height * @state.M[4])

    text_t: (subj_text)->
        {font_size, text_width, x, y} = subj_text
        origin: vec2.transformMat3 vec2.create(), [x, y], @state.M
        text_width: text_width * @state.M[0]
        font_size: -(font_size * @state.M[4])


    area_rect: ->
        subj =
            width: 200
            height: 48.39
            x: -100
            y: 24.195
        @rect_t subj

    top_yellow_bar_rect: ->
        subj =
            width: 200
            height: 2.89
            x: -100
            y: 23.368
        @rect_t subj

    reviews_rect: ->
        subj =
            width: 68.87
            height: 44.467
            x: 31.13
            y: 20.47215
        @rect_t subj

    reviews_scroller: ->
        subj =
            width: 68.87
            height: 35.16
            x: 31.13
            y: 11.168
        @rect_t subj

    tab_one: ->
        subj =
            width: 20.687
            height: 9.72
            x: -34.64
            y: 20.47215
        @rect_t subj

    tab_one_image: ->
        subj =
            x: -34
            y: 20
            width: 18
            height: 10
        @rect_t subj

    tab_two: ->
        subj =
            width: 24.405
            height: 9.72
            x: -13.953
            y: 20.47215
        @rect_t subj

    tab_two_image: ->
        subj =
            x: -13
            y: 20
            width: 20
            height: 8
        @rect_t subj

    tab_three: ->
        subj =
            width: 20.687
            height: 9.72
            x: 10.452
            y: 20.47215
        @rect_t subj

    tabs_area: ->
        subj =
            width: 65.77
            height: 35.16
            x: -34.64
            y: 11.168
        @rect_t subj

    review_blurb_area: (pos) ->
        # pos can be 0 to 2 (there are 3 positions available)
        y_pos = (pos)->
            return 11.168 - (pos * 11.719)
        subj =
            width: 68.7
            height: 11.719
            x: 31.13
            y: y_pos(pos)
        @rect_t subj

    review_blurb_text: (pos)->
        y_pos = (pos)->
            return 10 - (pos * 11.719)
        subj =
            x: 10
            y: y_pos(pos)


    reviews_title: ->
        subj =
            font_size: 5.377
            text_width: 25.439
            x: 37.33
            y: 14.7
        @text_t subj

    reviews_number: ->
        subj =
            text_width: 8.89
            font_size: 2.89
            x: 65.45
            y: 14.7
        @text_t subj



    render: ->

        area_rect = @area_rect()
        top_yellow_bar_rect = @top_yellow_bar_rect()
        reviews_rect = @reviews_rect()
        reviews_title = @reviews_title()
        reviews_number = @reviews_number()
        reviews_scroller = @reviews_scroller()
        tabs_area = @tabs_area()
        tab_one = @tab_one() ; tab_two = @tab_two() ; tab_three = @tab_three()
        tab_one_image = @tab_one_image()
        tab_two_image = @tab_two_image()

        svg
            width: '100%'
            height: '100%'
        ,
            rect
                x: area_rect.origin[0]
                y: area_rect.origin[1]
                width: area_rect.width
                height: area_rect.height
                fill: '#F6F6F6'
            rect
                x: top_yellow_bar_rect.origin[0]
                y: top_yellow_bar_rect.origin[1]
                width: top_yellow_bar_rect.width
                height: top_yellow_bar_rect.height
                fill: '#EFBD00'

            rect
                x: tabs_area.origin[0]
                y: tabs_area.origin[1]
                width: tabs_area.width
                height: tabs_area.height
                fill: 'purple'

            rect
                x: tab_one.origin[0]
                y: tab_one.origin[1]
                width: tab_one.width
                height: tab_one.height
                fill: 'orange'
            image
                x: tab_one_image.origin[0]
                y: tab_one_image.origin[1]
                width: tab_one_image.width
                height: tab_one_image.height
                xlinkHref: 'file:../assets/dhgatelogo.png'
            rect
                x: tab_two.origin[0]
                y: tab_two.origin[1]
                width: tab_two.width
                height: tab_two.height
                fill: 'grey'
                onClick: -> c 'here!!!!!!!!!!!!!!!!!!!'
            image
                x: tab_two_image.origin[0]
                y: tab_two_image.origin[1]
                width: tab_two_image.width
                height: tab_two_image.height
                xlinkHref: 'file:../assets/ebaycolor.png'
            rect
                x: tab_three.origin[0]
                y: tab_three.origin[1]
                width: tab_three.width
                height: tab_three.height
                fill: 'green'
            rect
                x: reviews_rect.origin[0]
                y: reviews_rect.origin[1]
                width: reviews_rect.width
                height: reviews_rect.height
                fill: 'yellow'
            rect
                x: reviews_scroller.origin[0]
                y: reviews_scroller.origin[1]
                width: reviews_scroller.width
                height: reviews_scroller.height
                fill: 'lightblue'
            text
                x: reviews_title.origin[0]
                y: reviews_title.origin[1]
                'font-size': reviews_title.font_size
                'font-family': 'Helvetica'
                fill: '#7D7D7D'
                textLength: reviews_title.text_width
                ,
                "Reviews"
            text
                x: reviews_number.origin[0]
                y: reviews_number.origin[1]
                'font-size': reviews_number.font_size
                'font-family': 'Verdana'
                fill: '#666666'
                textLength: reviews_number.text_width
                ,
                "(+388)"

            for i in [0 .. 2]
                review_blurb_area = @review_blurb_area(i)
                temp_color = switch i
                    when 0 then 'red'
                    when 1 then 'blue'
                    when 2 then 'lightgreen'

                rect
                    x: review_blurb_area.origin[0]
                    y: review_blurb_area.origin[1]
                    width: review_blurb_area.width
                    height: review_blurb_area.height
                    fill: temp_color


# module.exports = widget

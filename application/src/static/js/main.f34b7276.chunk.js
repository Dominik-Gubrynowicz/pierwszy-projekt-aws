(this["webpackJsonpaws-meme-generator-ui"]=this["webpackJsonpaws-meme-generator-ui"]||[]).push([[0],{31:function(e,t,n){},51:function(e,t,n){},52:function(e,t,n){"use strict";n.r(t);var a,c,i,s=n(0),r=n.n(s),o=n(23),m=n.n(o),d=(n(31),n(6)),u=n(7),l=n(10),h=n(9),j=n(4),g=n(5),p=n(3),b=n.n(p),f=n(1),x=g.a.img(a||(a=Object(j.a)(["\n    max-height: 600px;\n    max-width: 550px;\n"]))),O=function(e){Object(l.a)(n,e);var t=Object(h.a)(n);function n(e){var a;return Object(d.a)(this,n),(a=t.call(this,e)).updateImage=function(e){a.setState({memImage:window.Configs.PhotosURL+"/download/"+e})},a.handleInputChange=function(e){a.setState({memText:e.target.value})},a.handleCreateMemButtonClick=function(){console.log(a.state),b.a.post(window.Configs.ApiURL+"memes",{text:a.state.memText}).then((function(e){a.updateImage(e.data.fileName)}))},a.state={memImage:null,memText:"Tu wpisz tekst mema"},a}return Object(u.a)(n,[{key:"render",value:function(){return Object(f.jsxs)("div",{className:"c-create-meme__wrapper",children:[Object(f.jsx)("div",{className:"c-create-meme__form",children:Object(f.jsxs)("div",{className:"c-create-meme__form-wrapper",children:[Object(f.jsx)("textarea",{rows:2,value:this.state.memText,defaultValue:this.state.memText,onChange:this.handleInputChange}),Object(f.jsx)("button",{className:"c-create-meme__button",onClick:this.handleCreateMemButtonClick,children:"Utw\xf3rz"})]})}),Object(f.jsx)("div",{className:"c-create-meme__img-wrapper",children:this.state.memImage?Object(f.jsx)(x,{src:this.state.memImage}):Object(f.jsx)("p",{children:"Tutaj pojawi si\u0119 nowy mem"})})]})}}]),n}(r.a.Component),w=g.a.div(c||(c=Object(j.a)(["\n  display: grid;\n  grid-template-columns: 1fr 1fr;\n  column-gap: 48px;\n  row-gap: 48px;\n  justify-items: center;\n  align-items:center;\n  margin-bottom: 128px;\n\n"]))),v=g.a.img(i||(i=Object(j.a)(["\n  width: 100%;\n  background-position: center;\n  background-size:cover;\n  background-color: #ddd;\n  background-repeat: no-repeat;\n  min-height: 500px;\n"]))),C=function(e){Object(l.a)(n,e);var t=Object(h.a)(n);function n(){var e;return Object(d.a)(this,n),(e=t.call(this)).state={last10Images:[]},e}return Object(u.a)(n,[{key:"componentDidMount",value:function(){var e=this;b.a.get(window.Configs.PhotosURL+"memes?maxItems=10").then((function(t){var n=[];t.data.forEach((function(e){n.push({id:e.id,url:window.Configs.PhotosURL+"/download/"+e.fileName})})),e.setState({last10Images:n})}))}},{key:"render",value:function(){return Object(f.jsx)(w,{children:this.state.last10Images.map((function(e){return Object(f.jsx)(v,{src:e.url},e.id)}))})}}]),n}(r.a.Component);n(51);var I=function(){return Object(f.jsx)("div",{children:Object(f.jsxs)("div",{className:"container",children:[Object(f.jsx)("div",{className:"header",children:"Memy w Chmurze"}),Object(f.jsx)("div",{children:Object(f.jsxs)("div",{children:[Object(f.jsx)(O,{}),Object(f.jsx)(C,{})]})})]})})},k=function(e){e&&e instanceof Function&&n.e(3).then(n.bind(null,53)).then((function(t){var n=t.getCLS,a=t.getFID,c=t.getFCP,i=t.getLCP,s=t.getTTFB;n(e),a(e),c(e),i(e),s(e)}))};b.a.defaults.headers.post["Content-Type"]="application/json",m.a.render(Object(f.jsx)(r.a.StrictMode,{children:Object(f.jsx)(I,{})}),document.getElementById("root")),k()}},[[52,1,2]]]);
//# sourceMappingURL=main.f34b7276.chunk.js.map
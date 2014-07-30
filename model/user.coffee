schema = new Schema
  name: {type: String,  default :''}
  email: {type:String, default :''}
  phone: {type:String, default :''}
  password: {type:String, default :''}
  role: {type:String, default :''}
  createTime: {type:Date, default : new Date()}
  status:{type:Number, default :0}

#  informations: [{ type: Schema.ObjectId, ref: 'Information' }]
#  comments:[{ type: Schema.ObjectId, ref: 'Comment' }]

module.exports = User = mongoose.model('User', schema, 'user')
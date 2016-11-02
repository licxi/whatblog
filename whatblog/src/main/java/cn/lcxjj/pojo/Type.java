package cn.lcxjj.pojo;

public class Type {
    private Integer id;

	private String typeName;

	private String typeDesc;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName == null ? null : typeName.trim();
	}

	public String getTypeDesc() {
		return typeDesc;
	}

	public void setTypeDesc(String typeDesc) {
		this.typeDesc = typeDesc == null ? null : typeDesc.trim();
	}

	@Override
	public String toString() {
		return "Type [id=" + id + ", typeName=" + typeName + ", typeDesc=" + typeDesc + "]";
	}

	
}
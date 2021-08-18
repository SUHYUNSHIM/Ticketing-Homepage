package boardVO;

public class ViewVO {

	private int aid;
	private String name;
	private String subject;
	private String content;
	private int hits;
	
	public ViewVO(int aid, String name, String subject, String content, int hits) {
		this.aid = aid;
		this.name = name;
		this.subject = subject;
		this.content = content;
		this.hits = hits;
	}

	

	public int getAid() {
		return aid;
	}



	public void setAid(int aid) {
		this.aid = aid;
	}



	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getHits() {
		return hits;
	}

	public void setHits(int hits) {
		this.hits = hits;
	}
	
	
	
	
	
	
	
	
	
}
